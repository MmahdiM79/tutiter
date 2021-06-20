


-- check that kasra80 is following ae2079 or not
SELECT *
FROM follow
WHERE user1 = userID('kasra80') AND user2 = userID('ae2079');


-- kasra80 unfollow mahdi79
DELETE FROM follow 
WHERE 
	user1 =  userID('kasra80') and userID('ae2079')
;



