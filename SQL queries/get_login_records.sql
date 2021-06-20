

-- get the login records of given username
SELECT date_time
FROM login_records 
WHERE user_id = userID('am80')
ORDER BY date_time DESC 

