


-- get posts of mahdi79 following users
-- ordered by date

SELECT userNAME(sender_id) as sender, ava, write_date
FROM avas a
JOIN follow f
	ON f.user2 = a.sender_id
WHERE f.user1 = userID('mahdi79')
ORDER BY write_date DESC;


