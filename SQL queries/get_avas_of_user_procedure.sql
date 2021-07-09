


DELIMITER //

CREATE PROCEDURE `avas_of_user`(IN `username` VARCHAR(20), OUT res BOOL)
`scope`:
BEGIN 

	-- check given username
	IF userID(username) IS NULL
    THEN
		SELECT 'given username is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check that given uers have blocked doer of this procedure or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = userID(username))
    THEN
        SELECT 'the given user have blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- set resualt
    SELECT TRUE INTO res;

    SELECT DISTINCT id, ava, write_date 
    FROM avas
    WHERE sender_id = userID(username) AND
        a.comment_of IS NULL
    ORDER BY a.write_date DESC;

END;