




DELIMITER $$

CREATE FUNCTION getDOERid() 
RETURNS INT 
DETERMINISTIC

BEGIN
   RETURN (
        SELECT user_id 
        FROM login_records 
        ORDER BY date_time DESC 
        LIMIT 1
    );
END; 






