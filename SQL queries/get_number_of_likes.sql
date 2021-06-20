





-- am80 wants to see the number of likes of ava with id 3

SELECT DISTINCT 
    ava, count(ava_id) as n_likes
    
FROM avas a
LEFT OUTER JOIN blocked b
	ON a.sender_id = b.user1
JOIN likes l
	ON l.ava_id = a.id
    
WHERE a.id = 3 
	  AND (
		sender_id NOT IN 
			(select user1 from blocked where user2 = userID('am80')) 
		OR 
        sender_id IS NULL
	  )
            
GROUP BY a.id
 
 





