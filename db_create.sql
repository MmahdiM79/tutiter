CREATE DATABASE `tutiter`;





-- create users table 
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `Fname` VARCHAR(20) NOT NULL,
    `Lname` VARCHAR(20) NOT NULL,
    `birth_day` DATE NOT NULL,
    `register_date` DATE NOT NULL,
    `bio` varchar(64) DEFAULT NULL,
    
    PRIMARY KEY(`id`, `username`)
);
 



-- create avas table
CREATE TABLE `avas` (
    `id` INT AUTO_INCREMENT,
    `sender_id` INT NOT NULL,
    `ava` varchar(256) NOT NULL,
    `write_date` DATE NOT NULL,
    
    PRIMARY KEY(`id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
);




-- create messages table
CREATE TABLE `messages` (
	`id` INT AUTO_INCREMENT,
    `sender_id` INT NOT NULL,
    `receiver_id` INT NOT NULL,
    `message` VARCHAR(256) NOT NULL,
    
    PRIMARY KEY(`id`),
    FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
    FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`)
);




-- create hashtags table
CREATE TABLE `hashtags` (
	`id` INT AUTO_INCREMENT,
    `ava_id` INT NOT NULL,
    `hashtag` CHAR(5) NOT NULL,
    
    PRIMARY KEY (`id`, `hashtag`),
    FOREIGN KEY (`ava_id`) REFERENCES `avas` (`id`)
);