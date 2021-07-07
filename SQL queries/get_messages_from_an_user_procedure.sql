



DELIMITER //

CREATE PROCEDURE `get_messages`(IN `username` VARCHAR(20), OUT res BOOL)
`scope`:
BEGIN

    -- check give username
    IF userID(username) NOT IN (SELECT id FROM users) OR userID(username) IS NULL
    THEN
        SELECT 'given username is invalid!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- compare username_id with doer
    IF @doer = userID(username)
    THEN
        SELECT 'you want to see messages from yourself? :) !' as `status`;
        SELECT FALSE INTO res;
		    LEAVE scope;
    END IF;



    -- set resualt
    SELECT TRUE INTO res;

    -- show messages
    SELECT m.message, a.ava as related_ava, m.sent_date
    FROM messages m
    RIGHT OUTER JOIN avas a
		ON m.ava_id = a.id
    WHERE m.reciver_id = @doer AND m.sender_id = userID(username);

END;



