




-- kasra79 wants to see mahdi79 ava's comments




-- check that mahdi79 blocked kasra80 or not
SELECT *
FROM blocked
WHERE user1 = userID('mahdi79') and user2 = userID('kasra79');



-- get comments 
SELECT DISTINCT *
FROM avas a1, avas a2, comments c
Where a1.id = '2' and (c.comment_id = a2.id and c.ava_id = '2')






