

-- post a new ava in tutiter
INSERT INTO avas (sender_id, ava)
VALUE (
	(SELECT id FROM users WHERE username = 'kasra80'),
    'avalin post man tu tutiter'
);

