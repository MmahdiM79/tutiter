







DELIMITER //

CREATE PROCEDURE `set_hashtag`(IN `ava_id` INT, IN `hashtag` CHAR(5), OUT res BOOL)
`scope`:
BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check given ava id
    IF ava_id NOT IN (SELECT id FROM avas WHERE sender_id = @doer)
    THEN
        SELECT 'your given ava_id is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- check hashtag pattern
    IF hashtag NOT REGEXP '^[a-z][a-z][a-z][a-z][a-z]$'
    THEN
        SELECT 'your given hashtag has wrong pattern!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- check that we have added this hashtag before or not
    IF hashtag NOT IN (SELECT h.hashtag FROM hashtags)
    THEN
        INSERT INTO hashtags VALUE (DEFAULT, hashtag);
    END IF;

	
    -- set hashtag to ava
    INSERT INTO avas_hashtags VALUE (ava_id, hashtagID(hashtag));
		
	-- set resualt
    SELECT 'your given hashtag added to your ava successfully' as `status`;
	SELECT TRUE INTO res;
    
END;

    







