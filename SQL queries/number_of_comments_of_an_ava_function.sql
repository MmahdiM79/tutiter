









DELIMITER $$

CREATE FUNCTION `nCommentsAva`(ava_id INT) 
RETURNS INT 
DETERMINISTIC

BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure


	-- check that sender of given ava have block the doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = avaSenderID(ava_id))
    THEN
		RETURN 0;
	END IF;
    
    

    RETURN (
        SELECT DISTINCT count(a.sender_id)
	    FROM avas a
	    LEFT OUTER JOIN blocked b
		    ON b.user1 = a.sender_id
	    WHERE a.comment_of = ava_id AND (b.user2 != @doer OR b.user2 IS NULL)
    );
END; 







