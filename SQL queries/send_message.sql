




-- ae2079 wants to send a message to mahdi79

-- check that mahdi79 has blocked ae2079 or not
SELECT * FROM blocked WHERE user1 = userID('mahdi79') AND user2 = userID('ae2079');


-- check that sender of ava with id 6 has blocked mahdi79 or not
SELECT * FROM blocked WHERE user1 = avaSenderID(6) AND user2 = userID('mahdi79');



-- add ae2079 message
INSERT INTO messages VALUE (DEFAULT, userID('ae2079'), userID('mahdi79'), 'ino didi?', '6', DEFAULT);




