



DELIMITER //

CREATE TRIGGER `avas_log` AFTER INSERT 
ON avas FOR EACH ROW
BEGIN 
    INSERT INTO avasLog VALUE (NEW.sender_id, NEW.id, DEFAULT);
END;




