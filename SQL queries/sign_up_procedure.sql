




DELIMITER //

CREATE PROCEDURE `sign_up`(IN `username` VARCHAR(20),
                           IN `password` VARCHAR(128),
                           IN `Fname` VARCHAR(20),
                           IN `Lname` VARCHAR(20),
                           IN `birth_day` DATE,
                           OUT res BOOL)
`scope`:
BEGIN

    -- check username
    IF username IN (SELECT u.username FROM users u)
    THEN
        SELECT 'this username is already taken!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;



    -- create account
    INSERT INTO users
    VALUE (username, SHA1(password), Fname, Lname, birth_day, DEFAULT, DEFAULT);

    -- set resualt
    SELECT 'your account created successfully!' as `status`;
    SELECT TRUE INTO res;


END;










