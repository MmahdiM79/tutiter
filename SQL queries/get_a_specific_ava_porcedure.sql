











DELIMITER //

CREATE PROCEDURE `get_ava`(IN `ava_id` INT, OUT res BOOL)
`scope`:
BEGIN 

    -- check given ava id
    IF ava_id NOT IN (SELECT id FROM avas)
    THEN
        SELECT 'the given ava id is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;

        
    SET @`doer` = getDOERid(); -- find the doer of this procedure
    SET @`sender_id` = (SELECT sender_id FROM avas WHERE id = ava_id); -- find sender id of given ava


    -- check that sender of this ava have blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = @sender_id)
    THEN
        SELECT 'the sender of this ava have blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- set result
    SELECT TRUE INTO res;
    
    -- find ava details
    SELECT id, userNAME(sender_id) as sender, ava, write_date 
    FROM avas 
    WHERE id = ava_id;
    

END;







