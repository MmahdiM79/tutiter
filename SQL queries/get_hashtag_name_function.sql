




DELIMITER $$

CREATE FUNCTION hashtagNAME(hashtag_id INT) 
RETURNS CHAR(5)
DETERMINISTIC

BEGIN
   RETURN (SELECT hashtag FROM hashtags WHERE id = hashtag_id);
END; 






