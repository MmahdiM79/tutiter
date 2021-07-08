



DELIMITER //

CREATE PROCEDURE `user_avas` (OUT res BOOL)
`scope`:
BEGIN 

    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check number of doer avas
    if (SELECT count(id) FROM avas WHERE sender_id = @doer GROUP BY sender_id)
		IS NULL
    THEN
        SELECT 'you have not sent any ava yet!' as `status`;
        SELECT FALSE INTO res;
        LEAVE scope;
    END IF;


    -- set resualt
    SELECT TRUE INTO res;


    -- show user avas
    SELECT id, ava, write_date
    FROM avas
    WHERE sender_id = @doer AND comment_of IS NULL
    ORDER BY write_date DESC;
    
END;




