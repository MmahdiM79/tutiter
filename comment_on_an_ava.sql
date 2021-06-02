




-- mahdi79 leave a comment on alisaz post

-- check that alisaz blocked mahdi79 or not
SELECT *
FROM blocked
WHERE user1 = userID('alisaz') and user2 = userID('mahdi79');


-- add mahdi79 comment if the resualt of pervious query is null
INSERT INTO avas(sender_id, ava, comment_of) 
VALUE (userID('mahdi79'), 'alli shode', '7');






