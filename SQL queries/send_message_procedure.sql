



DELIMITER //

CREATE PROCEDURE `send_message`(IN `message` VARCHAR(256), 
								IN `reciver_username` VARCHAR(20), 
                                IN `related_ava_id` INT, 
                                OUT res BOOL)
`scope`:
BEGIN

    -- check given ava id
    IF related_ava_id IS NOT NULL
    THEN
		IF related_ava_id NOT IN (SELECT id FROM avas)
        THEN
			SELECT 'given related ava id is invalid!' as `status`;
            SELECT FALSE INTO res;
            LEAVE scope;
		END IF;
	END IF;
    
    
    SET @`doer` = getDOERid(); -- find the doer of this procedure
    
    
    -- check that sender of given related ava id have blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = avaSenderID(related_ava_id))
    THEN
		SELECT 'the sender of given related ava id have bloked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;
    
    
	-- check that reciver of this message have blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = userID(reciver_username))
    THEN
		SELECT 'you can send message to this user. you are blocked!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
	END IF;
    
    
    
    -- send message
    INSERT INTO messages VALUE (DEFAULT, @doer, userID(reciver_username), message, related_ava_id, DEFAULT);
    
    -- set resualt
    SELECT 'your message sent successfully' as `status`;
    SELECT TRUE INTO res;
    
END;




