

-- get the password of given username
-- if get an empty column we find out that 
-- we dont have any user with this username
SELECT *
FROM users
WHERE username = 'kasra80' AND  password = SHA1('4567');



-- now set the login time
INSERT INTO login_records ( user_id )
VALUE (userID('kasra80'));

