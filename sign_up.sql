

-- first check that the user is exist or not
-- given user id: kasra80
SELECT *
FROM users u
WHERE u.username = 'kasra80';



-- now add the new user
INSERT INTO users (
	username,
    password,
    Fname,
    Lname,
    birth_day,
)
VALUE ('kasra80', '4567', 'kasra', 'zarei', '2001-04-23');


