




DELIMITER //

CREATE PROCEDURE `send_comment`(IN `comment` VARCHAR(256), IN `ava_id` INT, OUT res BOOl)
`send_comment_scope`:
BEGIN

    -- check that given ava exist or not 
    SET @max_ava_id = (SELECT max(id) FROM avas);
    IF (ava_id > @max_ava_id OR ava_id < 0)
    THEN
        SELECT 'given ava id is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE send_comment_scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure

    
    -- check that sender of given ava id have blocked 
    -- the doer of this procedure or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = avaSenderID(ava_id))
    THEN
        SELECT 'the sender of this ava have blocked you!' as `status`;
        SELECT FALSE INTO res;
        lEAVE send_comment_scope;


	-- insert the given comment
    ELSE
        INSERT INTO avas(sender_id, ava, comment_of) VALUE (@doer, comment, ava_id);
        SELECT 'your comment added successfully!' as `status`;
        SELECT TRUE INTO res;
    END IF;


END;