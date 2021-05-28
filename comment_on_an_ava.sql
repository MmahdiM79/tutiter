




-- kasra80 leave a comment on mahdi79 post


-- check that mahdi79 blocked kasra80 or not
SELECT *
FROM blocked
WHERE user1 = userID('mahdi79') and user2 = userID('kasra79');


-- add kasra80 comment if the resualt of pervious query is null
INSERT INTO avas(sender_id, ava) 
VALUE (userID('kasra80'), 'alli shode');

INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '2'
);




