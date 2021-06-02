




-- am80 wants to see alisaz ava's comments



-- check that alisaz blocked am80 or not
SELECT *
FROM blocked
WHERE user1 = userID('alisaz') and user2 = userID('am80');




-- get comments 
SELECT DISTINCT userNAME(a2.sender_id) as sender, a2.ava, a2.write_date

FROM avas a1
JOIN avas a2
	ON a1.id = a2.comment_of
LEFT OUTER JOIN blocked b
	ON b.user1 = a2.sender_id
    
WHERE a2.comment_of = '7' AND (b.user2 != userID('am80') OR b.user2 IS NULL)

ORDER BY a2.write_date
    







