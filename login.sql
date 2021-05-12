

-- get the password of given username
-- if get an empty column we find out that 
-- we dont have any user with this username
SELECT password
FROM users
WHERE username = 'kasra80';



-- now set the login time
INSERT INTO login_records ( user_id )
VALUE ((select id from users where username = 'kasra80'));