CREATE DATABASE IF NOT EXISTS traning;

DROP DATABASE IF EXISTS traning;

CREATE DATABASE IF NOT EXISTS training;

USE training;

CREATE TABLE leader(
	id TINYINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL
);

DROP TABLE trainee;

CREATE TABLE trainee(
	TraineeID TINYINT AUTO_INCREMENT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Birth_Date DATE,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ INT CHECK(ET_IQ >= 0 AND ET_IQ <= 20),
    ET_Gmath INT CHECK(ET_Gmath >= 0 AND ET_Gmath <= 20),
    ET_English INT CHECK(ET_English >= 0 AND ET_English <= 50),
    Training_Class CHAR(3) NOT NULL,
    Evaluation_Notes VARCHAR(150),
    leader_id TINYINT,
    CONSTRAINT FOREIGN KEY fk_trainee_leader (leader_id) REFERENCES leader(id)
);































