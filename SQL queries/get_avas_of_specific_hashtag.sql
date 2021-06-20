



-- alisaz search for avas with price hashtag

SELECT DISTINCT userNAME(sender_id) as sender, ava, 'price' as hashtag
FROM avas a
LEFT OUTER JOIN blocked b
	ON a.sender_id = b.user1
JOIN avas_hashtags h
	ON a.id = h.ava_id
WHERE h.hashtag_id = hashtagID('price') AND 
	  (b.user2 != userID('alisaz') OR b.user2 IS NULL)



