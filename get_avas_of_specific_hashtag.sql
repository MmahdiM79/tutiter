


SELECT DISTINCT userNAME(sender_id) as sender, ava
FROM avas a
LEFT OUTER JOIN blocked b
	ON a.sender_id = b.user1
JOIN hashtags h
	ON a.id = h.ava_id
WHERE h.hashtag = 'price' and (b.user2 != userID('alisaz') OR b.user2 IS NULL)



