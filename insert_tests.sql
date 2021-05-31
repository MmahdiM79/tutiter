INSERT INTO users (
    username,
    password,
    Fname,
    Lname,
    birth_day,
    register_date,
    bio
)
VALUES 
     ('mahdi79', '1234', 
     'mahdi', 'malmasi', 
     '2000-01-01', '2020-01-01',
     'learning sql')
     ,
     ('ae2079', '4231', 
     'ali', 'ebrahimi', 
     '2001-01-01', '2021-01-01',
     DEFAULT)
     ,
     ('am80', '4321', 
     'amir', 'morteza zadeh', 
     '2001-05-23', '2019-06-05',
     DEFAULT)
     ,
     ('alisaz', '9876', 
     'alireza', 'mohseni', 
     '2001-11-10', '2018-01-01',
     'song producer')
     ,
     ('nvdmsv', '6789', 
     'navid', 'musavi zadeh', 
     '2000-01-01', '2020-01-01',
     'giutarist')
;





INSERT INTO avas (
    sender_id,
    ava,
    write_date
)
VALUES
    ('1', 'test avaliye', '2017-01-01 09:41:00'),
    ('1', 'avalin ava tutiter', '2017-02-02 09:41:00'),
    ('2', 'laptop shadidan gerun shode !', '2019-05-03 09:41:00'),
    ('3', 'khaste az in uni', '2021-02-04 09:41:00'),
    ('3', '@__@ ajab', '2021-01-23 09:41:00'),
    ('4', 'new bit add on spatify', '2019-11-05 09:41:00'),
    ('4', 'check out my new song guys', '2021-02-10 09:41:00'),
    ('5', 'giutaram emruz pokid :/', '2020-09-15 09:41:00'),
    ('2', 'dars ha vel kon nistan', '2020-10-29 09:41:00'),
    ('5', 'sim giutar khub dige nis', '2018-12-12 09:41:00')
;





INSERT INTO hashtags (
	ava_id,
    hashtag
)
VALUES
	('1', 'test1'), 
    ('2', '1avas'),
    ('3', 'price'),
    ('4', 'uniPM'),
    ('5', 'ajaab'),
    ('6', 'music'),
    ('7', 'music'),
    ('8', 'gitar'),
    ('9', 'exams'),
    ('10','gitar'),
    ('1', 'newPS'),
    ('6', 'songs'),
    ('9', 'lssns'),
    ('4', 'schul'),
    ('5', 'alaki'),
    ('8', 'price'),
    ('3', 'lptop'),
    ('10','neded')
;




INSERT INTO blocked 
VALUES
	('1', '3'),
    ('2', '4')
;



INSERT INTO follow
VALUES
	('1', '2'),
    ('1', '4'),
    ('1', '5'),
    ('2', '1'),
    ('2', '3'),
    ('2', '5'),
    ('3', '2'),
    ('3', '5'),
    ('3', '4'),
    ('4', '5'),
    ('5', '4')
;




INSERT INTO likes
VALUES
	('1', '3'),
    ('1', '9'),
    ('1', '6'),
    ('1', '8'),
    ('2', '1'),
    ('2', '4'),
    ('2', '5'),
    ('2', '10'),
    ('3', '3'),
    ('3', '9'),
    ('3', '8'),
    ('3', '7'),
    ('4', '8'),
    ('4', '10'),
    ('5', '6'),
    ('5', '7')
;






INSERT INTO avas(sender_id, ava) VALUE ('1', 'are khayli :(');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '3'
);
INSERT INTO avas(sender_id, ava) VALUE ('2', 'are be khoda');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '4'
);
INSERT INTO avas(sender_id, ava) VALUE ('3', 'alii bud');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '7'
);
INSERT INTO avas(sender_id, ava) VALUE ('4', 'ay baba shans nadari');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '8'
);
INSERT INTO avas(sender_id, ava) VALUE ('5', 'nice');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '7'
);
INSERT INTO avas(sender_id, ava) VALUE ('1', 'are manam daram divune misham');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '9'
);
INSERT INTO avas(sender_id, ava) VALUE ('2', 'chi ajab *_*');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '5'
);
INSERT INTO avas(sender_id, ava) VALUE ('3', 'shans nadari');
INSERT INTO comments 
VALUE (
	(SELECT id FROM avas ORDER BY write_date DESC LIMIT 1),
    '8'
);







INSERT INTO login_records (
	user_id,
    date_time
)
VALUES 
	('1', '2020-01-02 09:10:23'),
    ('2', '2021-01-02 09:10:23'),
    ('3', '2020-04-02 09:10:23'),
    ('4', '2019-01-02 09:10:23'),
    ('5', '2021-01-02 09:10:23'),
    ('4', '2019-04-02 09:10:23'),
    ('3', '2029-10-02 09:10:23')
;
