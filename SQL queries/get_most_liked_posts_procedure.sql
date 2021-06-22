




DELIMITER //

CREATE PROCEDURE `most_liked_avas`()
BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure

    SELECT 
        userNAME(a.sender_id) as sender, 
        a.ava, 
        count(l.ava_id) as n_likes
        
    FROM avas a
    lEFT OUTER JOIN likes l
        ON l.ava_id = a.id
        
    WHERE a.sender_id NOT IN 
                (select user1 from blocked where user2 = @doer)
        AND
        a.comment_of IS NULL
                
    GROUP BY a.id
    ORDER BY n_likes DESC

END;




