


-- kasra follows mahdi79 
INSERT INTO follow 
VALUE (
	(SELECT id FROM users WHERE username = 'kasra80'),
    (SELECT id FROM users WHERE username = 'mahdi79')
);


