




DELIMITER //

CREATE PROCEDURE `post_ava`(IN `ava` VARCHAR(256), OUT res BOOL)
`scope`:
BEGIN 

    -- check the length of ava
    IF length(ava) = 0
    THEN
        SELECT 'the given ava should not be empty!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- insert given ava
    INSERT INTO avas (sender_id, ava) VALUE (@doer, ava);

    -- set resualt
    SELECT 'your ava sent successfully!' as `status`;
    SELECT TRUE INTO res;


END;




