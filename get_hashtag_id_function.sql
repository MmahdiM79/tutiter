

DELIMITER $$

CREATE FUNCTION hashtagID(hashtag CHAR(5))
RETURNS INT
DETERMINISTIC

BEGIN
   RETURN (SELECT id FROM hashtag WHERE username = hashtag);
END; 


