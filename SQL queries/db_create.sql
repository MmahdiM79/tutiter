CREATE DATABASE `tutiter`;
USE `tutiter`;





-- create users table 
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `Fname` VARCHAR(20) NOT NULL,
    `Lname` VARCHAR(20) NOT NULL,
    `birth_day` DATE NOT NULL,
    `register_date` DATE NOT NULL DEFAULT  (current_date()),
    `bio` varchar(64) DEFAULT NULL,

    
    PRIMARY KEY(`id`, `username`)
);
 



-- create avas table
CREATE TABLE `avas` (
    `id` INT AUTO_INCREMENT,
    `sender_id` INT NOT NULL,
    `ava` varchar(256) NOT NULL,
    `write_date` DATETIME NOT NULL DEFAULT (now()),
    `comment_of` INT DEFAULT  NULL,

    
    PRIMARY KEY(`id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`comment_of`) REFERENCES  `avas` (`id`)
);




-- create messages table
CREATE TABLE `messages` (
	id INT AUTO_INCREMENT NOT NULL,
    sender_id INT NOT NULL,
    reciver_id INT NOT NULL,
    message VARCHAR(256) DEFAULT NULL,
    ava_id INT DEFAULT NULL,
    sent_date DATETIME NOT NULL DEFAULT (now()),

    
    PRIMARY KEY(`id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`reciver_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`ava_id`) REFERENCES `avas` (`id`)
);




-- create hashtags table
CREATE TABLE `hashtags` (
	`id` INT AUTO_INCREMENT,
    `hashtag` CHAR(5) NOT NULL,
    

    PRIMARY KEY (`id`, `hashtag`)
);




-- hold the hashtags of each post
CREATE TABLE `avas_hashtags` (
    `ava_id` INT NOT NULL,
    `hashtag_id` INT NOT NULL,


    FOREIGN KEY (`ava_id`) REFERENCES `avas` (`id`),
    FOREIGN KEY (`hashtag_id`) REFERENCES `hashtags` (`id`)
);




-- create blocked tabel
CREATE TABLE `blocked` (
	`user1` INT NOT NULL,
    `user2` INT NOT NULL,

    
    FOREIGN KEY (`user1`) REFERENCES `users` (`id`),
    FOREIGN KEY (`user2`) REFERENCES `users` (`id`)
);





-- create follow table
CREATE TABLE `follow` (
	`user1` INT NOT NULL,
    `user2` INT NOT NULL,
    

    FOREIGN KEY (`user1`) REFERENCES `users` (`id`),
    FOREIGN KEY (`user2`) REFERENCES `users` (`id`)
);




-- create likes table
CREATE TABLE `likes` (
	`user_id` INT NOT NULL,
    `ava_id` INT NOT NULL,
    

    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`ava_id`) REFERENCES `avas` (`id`)
);




-- create login records table
CREATE TABLE `login_records` (
	`user_id` INT NOT NULL,
    `date_time` DATETIME NOT NULL DEFAULT (now()),
    
    
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);




-- create signup log table
CREATE TABLE `signupLog` (
    `user_id` INT NOT NULL,
    `date_time` DATETIME NOT NULL DEFAULT (now()),


    PRIMARY KEY(`user_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
);




-- create avas log table
CREATE TABLE `avasLog` (
    `sender_id` INT NOT NULL,
    `ava_id` INT NOT  NULL,
    `date_time` DATETIME NOT NULL DEFAULT (now()),


    PRIMARY KEY(`sender_id`, `ava_id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users`(`id`),
    FOREIGN KEY (`ava_id`) REFERENCES `avas`(`id`)
);