









DELIMITER $$

CREATE FUNCTION avaSenderID(ava_id INT) 
RETURNS INT
DETERMINISTIC

BEGIN
   RETURN (SELECT sender_id FROM avas WHERE id = ava_id);
END; 







