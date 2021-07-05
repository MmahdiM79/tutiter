




DELIMITER //

CREATE PROCEDURE `login`(IN `username` VARCHAR(20), IN `password` VARCHAR(128), OUT res BOOL)
`scope`:
BEGIN

    -- check username
    IF username NOT IN (SELECT u.username FROM users u)
    THEN
        SELECT 'the given username or password is wrong!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- check password
    IF SHA1(password) != (SELECT u.password FROM users u WHERE u.username = username)
    THEN
        SELECT 'the given username or password is wrong!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;



    -- login
    INSERT INTO login_records ( user_id ) VALUE (userID(username));

    -- set resualt
    SELECT 'you have loged in successfully!' as `status`;
    SELECT TRUE INTO res;

END;



