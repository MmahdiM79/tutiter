



DELIMITER //

CREATE PROCEDURE `unblock`(IN `username` VARCHAR(20), OUT res BOOL)
`scope`:
BEGIN

    -- check that given username is valid or not
    IF username NOT IN (SELECT u.username FROM users u)
    THEN
        SELECT 'the given username is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check doer block list
    IF userID(username) NOT IN (SELECT user2 FROM blocked WHERE user1 = @doer)
    THEN
        SELECT 'you have not blocked given username!' as `status`;
        SELECT TRUE INTO res;
        LEAVE scope;
    END IF;



    -- unblocke given username
    DELETE FROM blocked WHERE user1 = @doer and user2 = userID(username);

    -- set resualt
    SELECT 'the given username unblocked successfully!' as `status`;
    SELECT TRUE INTO res;

END;





