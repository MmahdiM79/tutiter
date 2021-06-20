



-- mahdi79 want to see a list of users that have sent message to him

SELECT userNAME(sender_id), max(sent_date) as last_message
FROM messages m
WHERE reciver_id = 1
GROUP BY sender_id
ORDER BY last_message DESC


