


SELECT 
	userNAME(a.sender_id) as sender, 
    a.ava, 
    count(l.ava_id) as n_likes
    
FROM avas a
lEFT OUTER JOIN likes l
	ON l.ava_id = a.id
    
WHERE a.sender_id NOT IN 
			(select user1 from blocked where user2 = userID('alisaz'))
	  AND
      a.id NOT IN (select comment_id from comments)
            
GROUP BY a.id
ORDER BY n_likes DESC




