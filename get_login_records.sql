

-- get the login records of given username
SELECT date_time
FROM login_records l
JOIN users u
	ON u.id = l.user_id
WHERE u.username = 'am80'

