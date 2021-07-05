


DELIMITER //

CREATE PROCEDURE `unfollow`(IN `username` VARCHAR(20), OUT res BOOL)
`scope`:
BEGIN 

    -- check given username
    IF NOT usernameEXIST(username)
    THEN
		SELECT 'given username does not exist!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;
    
    
    SET @`doer` = getDOERid(); -- find the doer of this procedure

	-- check doer following list
    IF userID(username) NOT IN (SELECT user2 FROM follow WHERE user1 = @doer)
    THEN
		SELECT 'given username is not in your following list' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;
    
    
    
    -- unfollow given username
    DELETE FROM follow WHERE user1 =  @doer AND userID(username);
    
    -- set resualt
    SELECT 'given username unfollowed successfully!' as `status`;
    SELECT TRUE INTO res;
    
END;
		


