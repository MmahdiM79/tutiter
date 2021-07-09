






DELIMITER //

CREATE PROCEDURE `set_hashtag`(IN `hashtag` CHAR(5), IN `ava_id` INT, OUT res BOOL)
`scope`:
BEGIN

    -- check give hashtag
    IF NOT (hashtag REGEXP '^[a-z][a-z][a-z][a-z][a-z]$') 
    THEN
        SELECT 'given hashtag has wrong pattern!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check given ava id
    IF ava_id NOT IN (SELECT id FROM avas WHERE sender_id = @doer)
    THEN
        SELECT 'this ava id does not belong to you!' as `status`;
        SELECT FALSE INTO res;
		LEAVE scope;
    END IF;



    -- set resualt
    SELECT TRUE INTO res;
    SELECT 'give hashtag added to give ava successfully!' as `status`;

    -- set hashtag
    IF hashtag NOT IN (SELECT h.hashtag FROM hashtags h)
    THEN
        INSERT INTO hashtags VALUE (DEFAULT, hashtag);
    END IF;

    IF NOT EXISTS (SELECT * FROM avas_hashtags a WHERE a.ava_id = ava_id AND a.hashtag_id = hashtagID(hashtag))
    THEN
        INSERT INTO avas_hashtags VALUE (ava_id, hashtagID(hashtag));
    END IF;
    

END;







