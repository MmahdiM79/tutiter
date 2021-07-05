



DELIMITER //

CREATE PROCEDURE `users_that_likes_an_ava`(IN `ava_id` INT, OUT res BOOL)
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


    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = @ava_sender)
    THEN
        SELECT 'the sender of given ava id have blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


	-- show the users that likes the give ava id
    SELECT userNAME(l.user_id) as liker
    FROM likes l
    WHERE l.ava_id = ava_id
        AND l.user_id NOT IN 
            (select user1 from blocked where user2 = @doer);
            
END;


