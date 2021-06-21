




DELIMITER //

CREATE PROCEDURE `follow_user`(IN `username` VARCHAR(20), OUT res BOOL)
`follow_user_scope`:
BEGIN 

    SET @user_id = userID(username); -- find the user id of given username


    -- check that given username is valid or not
    IF @user_id IS NULL 
    THEN
        SELECT 'the given username is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE follow_user_scope;
    END IF;

    
    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check that given username have blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = @user_id)
    THEN
        SELECT 'the given username have blocked you!' as `status`;
        SELECT FALSE INTO res;
    
    -- check that doer have blocked the given username or not
    ELSEIF @user_id IN (SELECT user2 FROM blocked WHERE user1 = @doer)
	THEN
        SELECT 'you have blocked the given username!' as `status`;
        SELECT FALSE INTO res;
        
	-- check that doer have followed the given username or not
    ELSEIF @user_id IN (SELECT user2 FROM follow WHERE user1 = @doer)
    THEN
		SELECT 'you have followed this username!' as `status`;
        SELECT TRUE INTO res;
		
	-- add the given username to doer following list
    ELSE
		INSERT INTO follow VALUE (@doer, @user_id);
        SELECT 'the given username added to your following list successfully!' as `status`;
        SELECT TRUE INTO res;

    END IF;

END;









