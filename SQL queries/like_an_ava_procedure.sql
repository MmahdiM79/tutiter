




DELIMITER //

CREATE PROCEDURE `like_ava`(IN `ava_id` INT, OUT res BOOl)
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
    SET @`ava_sender` = avaSenderID(ava_id); -- find the sender of given ava id


    -- check that the sender of given ava id had blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = @ava_sender)
    THEN
        SELECT 'the sender of given ava id had blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- check that doer haven't like this ava before
    IF @doer IN (SELECT user_id FROM likes l WHERE l.ava_id = ava_id)
    THEN
        SELECT 'you have like this ava befor!' as `status`;
        SELECT TRUE INTO res;
        LEAVE scope;
    END IF;



    -- set doer like
    INSERT INTO likes VALUE (@doer, ava_id);

    -- set resualt
    SELECT 'you liked this ava!' as `status`;
    SELECT TRUE INTO res;

END;




