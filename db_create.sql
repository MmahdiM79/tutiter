CREATE DATABASE `tutiter`;





-- create users table 
CREATE TABLE `user` (
	`id` INT(20) AUTO_INCREMENT,
    `username` VARCHAR(20) NOT NULL,
    `password` VARCHAR(128) NOT NULL,
    `Fname` VARCHAR(20) NOT NULL,
    `Lname` VARCHAR(20) NOT NULL,
    `birth_day` DATE NOT NULL,
    `register_date` DATE NOT NULL,
    `bio` varchar(64) DEFAULT NULL,
    
    PRIMARY KEY(`id`, `username`)
);
 
