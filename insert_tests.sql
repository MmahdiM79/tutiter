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
     'new to tutiter')
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
    ('1', 'test avaliye', '2017-01-01'),
    ('1', 'avalin ava tutiter', '2017-02-02'),
    ('2', 'laptop shadidan gerun shode !', '2019-05-03'),
    ('3', 'khaste az in uni', '2021-02-04'),
    ('3', '@__@ ajab', '2021-01-23'),
    ('4', 'new bit add on spatify', '2019-11-05'),
    ('4', 'check out my new song guys', '2021-02-10'),
    ('5', 'giutaram emruz pokid :/', '2020-09-15'),
    ('2', 'dars ha vel kon nistan', '2020-10-29'),
    ('5', 'sim giutar khub dige nis', '2018-12-12')
;




INSERT INTO messages (
    sender_id,
    receiver_id,
    message
)
VALUES
    ('1', '2', 'salam. khubi?'),
    ('1', '2', 'che khabara?'),
    ('2', '1', 'khubam salamati'),
    ('2', '1', 'hich. daneshgah'),
    ('3', '5', 'giutaret dorost shod?'),
    ('5', '3', 'na hanuz'),
    ('3', '4', 'emruz miyay?'),
    ('4', '3', 'na kar daram'),
    ('3', '4', 'ey baba'),
    ('1', '4', 'ahang jadid alli bud'),
    ('4', '1', 'mersi')
;





