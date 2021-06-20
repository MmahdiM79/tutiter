





-- check that given hashtag is avialable or not
SELECT * FROM  hashtags WHERE hashtag = 'first';


-- add new hashtag to hashtags table
INSERT INTO hashtags VALUE (DEFAULT, 'first');


-- add a hashtag to a post
INSERT INTO avas_hashtags VALUE ('2', hashtagID('first'));




