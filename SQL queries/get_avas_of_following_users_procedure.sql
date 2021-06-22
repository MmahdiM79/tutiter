



DELIMITER //

CREATE PROCEDURE `avas_of_following`(OUT res BOOL)
`avas_of_following`:
BEGIN

    SET @`doer` = getDOERid(); -- find the doer of this procedure


    -- check doer following list
    IF (SELECT user2 FROM follow WHERE user1 = @doer) IS NULL 
    THEN
        SELECT 'you have not followed any user yet!' as `status`;
        SELECT FALSE INTO res;
        LEAVE follow_user_scope;
    END IF;


    -- show avas of users
    SELECT userNAME(sender_id) as sender, ava, write_date

    FROM avas a
    JOIN follow f
        ON f.user2 = a.sender_id
        
    WHERE f.user1 = @doer AND
        a.comment_of IS NULL

    ORDER BY write_date DESC;
END;



