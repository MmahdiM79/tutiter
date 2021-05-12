


-- kasra80 unfollow mahdi79
DELETE FROM follow 
WHERE 
	user1 =  (SELECT id FROM users WHERE username = 'kasra80')
    and 
    user2 = (SELECT id FROM users WHERE username = 'mahdi79')
;



