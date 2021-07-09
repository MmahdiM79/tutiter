





DELIMITER $$

CREATE FUNCTION `nLikesAva`(ava_id INT) 
RETURNS INT 
DETERMINISTIC

BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure
    
    RETURN (
        SELECT count(l.user_id) as n_likes
        
        FROM avas a
        lEFT OUTER JOIN likes l
            ON l.ava_id = a.id
            
        WHERE a.sender_id NOT IN (select user1 from blocked where user2 = @doer)
			AND l.user_id NOT IN (select user1 from blocked where user2 = @doer)
            AND a.id = ava_id
    );
END; 



