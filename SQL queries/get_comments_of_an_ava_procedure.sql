


DELIMITER //

CREATE PROCEDURE `comments_of_ava`(IN `ava_id` INT, OUT res BOOL)
`scope`:
BEGIN 

    -- check given ava id
    IF ava_id NOT IN (SELECT id FROM avas)
    THEN
        SELECT 'given ava id is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


	-- check that sender of given ava have block the doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = avaSenderID(ava_id))
    THEN
		SELECT 'sender of given ava have blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;
    
    
    -- set resualt
    SELECT TRUE INTO res;
    
    -- show the comments of given ava
    SELECT DISTINCT userNAME(a.sender_id) as sender, a.ava, a.write_date
	FROM avas a
	LEFT OUTER JOIN blocked b
		ON b.user1 = a.sender_id
	WHERE a.comment_of = ava_id AND (b.user2 != @doer OR b.user2 IS NULL)
	ORDER BY a.write_date;
    
    
END;


