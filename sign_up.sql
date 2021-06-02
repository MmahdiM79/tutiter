

-- first check that the user is exist or not
-- given user id: kasra80
-- the resualt of this query is null we will go to the next query
SELECT *
FROM users u
WHERE u.username = 'kasra80';



-- now add the new user
INSERT INTO users (
	username,
    password,
    Fname,
    Lname,
    birth_day
)
VALUE ('kasra80', SHA1('4567'), 'kasra', 'zarei', '2001-04-23');


