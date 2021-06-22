





DELIMITER //

CREATE PROCEDURE `avas_of_hashtag`(IN `hashtag` CHAR(5))
BEGIN 

    SET @`doer` = getDOERid(); -- find the doer of this procedure


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







