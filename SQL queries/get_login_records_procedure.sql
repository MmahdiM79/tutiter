




DELIMITER //

CREATE PROCEDURE `login_records`()
BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure

    SELECT date_time
    FROM login_records 
    WHERE user_id = @doer
    ORDER BY date_time DESC;

    
END;