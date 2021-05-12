

-- find the avas from given username
SELECT ava FROM avas
WHERE sender_id = (SELECT id FROM users WHERE username = 'kasra80');

