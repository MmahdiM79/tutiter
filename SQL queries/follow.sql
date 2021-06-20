



-- check that kasra80 is following mahdi79 and ae2079 or not
SELECT *
FROM follow
WHERE user1 = userID('kasra80') AND user2 = userID('mahdi79');

SELECT *
FROM follow
WHERE user1 = userID('kasra80') AND user2 = userID('ae2079');



-- kasra80 follows mahdi79 
INSERT INTO follow 
VALUES 
    (userID('kasra80'), userID('mahdi79')),
    (userID('kasra80'), userID('ae2079'))
;


