




-- mahdi79 wants to see ae2079 avas

SELECT DISTINCT userNAME(sender_id) as sender, ava 
FROM avas a
JOIN blocked b
	ON b.user1 = sender_id
WHERE NOT (user2 = userID('mahdi79') and user1 = userID('ae2079')) 
	  AND sender_id = userID('ae2079')
      
      
      
      
