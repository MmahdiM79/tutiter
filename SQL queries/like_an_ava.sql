



-- check that the sender of ava with id 3 had blocked mahdi79 or not
SELECT *
FROM blocked
WHERE user1 = (SELECT sender_id FROM avas WHERE id = 3) 
	  AND user2 = userID('mahdi79')
;


-- check that mahdi79 haven't like this ava before
SELECT *
FROM likes
WHERE user_id = userID('mahdi79') AND ava_id = 3
;



-- mahdi79 likes ava with id 3
INSERT INTO likes VALUE (userID('mahdi79'), '3');



