



DELIMITER //

CREATE PROCEDURE `block_user`(IN `username` VARCHAR(20), OUT `res` BOOl)
`block_user_scope`:
BEGIN

	-- check that user name is exist or not
	IF NOT usernameEXIST(username)
    THEN
		SELECT 'given username does not exist!' as `status`;
        SELECT FALSE INTO res;
		LEAVE block_user_scope;
	END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure
    SET @`username_id` = userID(username); -- find the user id of given username


    -- compare username_id with doer
    IF @doer = @username_id
    THEN
        SELECT 'you can not block yourself :) !' as `status`;
        SELECT FALSE INTO res;
		LEAVE block_user_scope;
    END IF;


	-- check that doer of this procedure has blocked given username or not
    IF @username_id in (
        SELECT user2 
        FROM blocked 
        WHERE user1 = @doer
        )
    THEN
        SELECT 'you have already blocked this user!' as `status`;
        SELECT true INTO res;
        
	-- block the given username
    ELSE
        INSERT INTO blocked VALUE (@doer, @username_id);
        DELETE FROM follow WHERE @doer and @username_id;
        DELETE FROM follow WHERE @username_id and @doer;
        SELECT 'given username blocekd successfully!' as `status`;
        SELECT  true INTO res;
    END IF;
END;



