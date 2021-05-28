



-- kasra80 block mahdi79
INSERT INTO blocked
VALUES
	(userID('kasra80'), userID('mahdi79')),
	(userID('mahdi79'), userID('kasra80'))
;
	

-- delete mahdi79 from kasra80 following list
DELETE FROM follow 
WHERE user1 = userID('kasra80') and user2 = userID('mahdi79');


-- delete kasra80 from mahdi79 following list
DELETE FROM follow 
WHERE user2 = userID('mahdi79') and user1 = userID('kasra80');


	