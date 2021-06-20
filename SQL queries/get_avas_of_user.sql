




-- mahdi79 wants to see ae2079 avas

SELECT DISTINCT userNAME(sender_id) as sender, ava, write_date 

FROM avas a
JOIN blocked b
	ON b.user1 = sender_id
    
WHERE user2 != userID('mahdi79') AND 
	  sender_id = userID('ae2079') AND
      a.comment_of IS NULL

ORDER BY a.write_date DESC
      
      
      
      
