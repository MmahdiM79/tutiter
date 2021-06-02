


-- am80 wants to see the users that liked ava with id 3

SELECT * FROM blocked 
WHERE user1 = avaSenderID(3) AND user2 = userID('am80');



SELECT userNAME(l.user_id) as liker
FROM likes l
WHERE l.ava_id = 3 
	AND l.user_id NOT IN 
		(select user1 from blocked where user2 = userID('am80')) 
	




