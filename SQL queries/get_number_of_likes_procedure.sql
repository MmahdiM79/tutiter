



DELIMITER //

CREATE PROCEDURE `number_of_likes`(IN `ava_id` INT, OUT res BOOL)
`scope`:
BEGIN

    -- check ava id 
    IF ava_id NOT IN (SELECT id FROM avas)
    THEN
        SELECT 'given ava id is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check that sender of given ava id have blocked doer or not
    IF @doer IN (SELECT user2 FROM blocked WHERE user1 = avaSenderID(ava_id))
    THEN
        SELECT 'sender of given ava id have blocked you!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- set resualt
    SELECT TRUE INTO res;

    -- show number of likes
    SELECT DISTINCT 
        ava, count(l.user_id) as n_likes
    FROM avas a
    LEFT OUTER JOIN likes l
        ON l.ava_id = a.id
    WHERE a.id = ava_id     
    GROUP BY a.id;

END;







