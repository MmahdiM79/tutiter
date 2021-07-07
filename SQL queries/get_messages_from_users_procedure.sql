




DELIMITER //

CREATE PROCEDURE  `messages_list`()
BEGIN 

    SET @`doer` = getDOERid(); -- find the doer of this procedure

	-- show messages list
    SELECT userNAME(sender_id) as username, max(sent_date) as last_message
    FROM messages m
    WHERE reciver_id = @doer
    GROUP BY sender_id
    ORDER BY last_message DESC;

END;




