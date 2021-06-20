





-- get posts of mahdi79 following users
-- ordered by date

SELECT userNAME(sender_id) as sender, ava, write_date

FROM avas a
JOIN follow f
	ON f.user2 = a.sender_id
JOIN blocked b
	ON a.sender_id = b.user1
    
WHERE f.user1 = userID('mahdi79') AND 
	  b.user2 != userID('mahdi79') AND
      a.comment_of IS NULL

ORDER BY write_date DESC;




