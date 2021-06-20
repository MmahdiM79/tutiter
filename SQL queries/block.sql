



-- check that kasra80 has blocked mahdi79 yet or not
SELECT * FROM blocked
WHERE user1 = userID('kasra80') AND user2 = userID('mahdi79');



-- kasra80 block mahdi79
INSERT INTO blocked
VALUES
	(userID('kasra80'), userID('mahdi79'))
;
	

-- delete mahdi79 from kasra80 following list
DELETE FROM follow 
WHERE user1 = userID('kasra80') and user2 = userID('mahdi79');


-- delete kasra80 from mahdi79 following list
DELETE FROM follow 
WHERE user2 = userID('mahdi79') and user1 = userID('kasra80');


	
	