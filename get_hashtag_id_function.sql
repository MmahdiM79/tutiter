

DELIMITER $$

CREATE FUNCTION hashtagID(hashtag CHAR(5))
RETURNS INT
DETERMINISTIC

BEGIN
   RETURN (SELECT id FROM hashtags h WHERE h.hashtag = hashtag);
END; 


