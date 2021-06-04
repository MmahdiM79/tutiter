




-- am80 wants to see alisaz ava's comments



-- check that alisaz blocked am80 or not
SELECT *
FROM blocked
WHERE user1 = userID('alisaz') and user2 = userID('am80');




-- get comments 
SELECT DISTINCT userNAME(a.sender_id) as sender, a.ava, a.write_date

FROM avas a
LEFT OUTER JOIN blocked b
	ON b.user1 = a.sender_id
    
WHERE a.comment_of = '7' AND (b.user2 != userID('am80') OR b.user2 IS NULL)

ORDER BY a.write_date
    







