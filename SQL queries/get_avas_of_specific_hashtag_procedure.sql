





DELIMITER //

CREATE PROCEDURE `avas_of_hashtag`(IN `hashtag` CHAR(5), OUT res BOOL)
`scope`:
BEGIN 

    -- check pattern of given hashtag
    IF NOT (hashtag REGEXP '^[a-z][a-z][a-z][a-z][a-z]$') 
    THEN
        SELECT 'the given hashtag has wrong pattern!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;

        
    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- set result
    SELECT TRUE INTO res;
    
    -- show the avas with given hashtag
    SELECT DISTINCT userNAME(sender_id) as sender, ava, a.write_date
    FROM avas a
    LEFT OUTER JOIN blocked b
	    ON a.sender_id = b.user1
    JOIN avas_hashtags h
	    ON a.id = h.ava_id
    WHERE h.hashtag_id = hashtagID(hashtag) AND 
	    (b.user2 != @doer OR b.user2 IS NULL)
    ORDER BY a.write_date DESC;

    
END;







