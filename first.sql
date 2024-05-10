-- ##########################################################
-- ###################### Module 2 ##########################
-- ##########################################################

-- USE programminghero;

-- CREATE TABLE Student(
-- 	Roll CHAR(4) PRIMARY KEY,
--     Name VARCHAR(50),
--     Marks DOUBLE
-- );

-- INSERT INTO Student
-- (Roll, Name, Marks) VALUES(1, 'Tahdi Islam', 98);

-- -- INSERT INTO student
-- -- (Roll, Name) VALUES(1, 'hello world');

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE Student
-- SET Name = 'Tahdi'
-- WHERE Roll = 1;
-- SET SQL_SAFE_UPDATES = 1;

-- SET  SQL_SAFE_UPDATES = 0;
-- DELETE FROM Student
-- WHERE Roll = 1;


-- #######################################################
-- #################### Module 3 #########################
-- #######################################################

USE programminghero;

-- create table with constraint name

-- method 1

CREATE TABLE Student
(
	Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(60) UNIQUE,
    Address VARCHAR(255) ,
    Age INT CHECK(Age > 10)
);

-- method 2

CREATE TABLE Student
(
	Roll CHAR(4),
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(60),
    Address VARCHAR(255),
    Age INT,
    PRIMARY KEY(Roll),
    UNIQUE(Email),
    CHECK(Age > 10)
);

-- method 3

CREATE TABLE Student
(
	Roll CHAR(4),
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(255),
    Age INT,
    Constraint PRIMARY KEY(Roll),
    Constraint UNIQUE(Email),
    Constraint CHECK(Age > 10)
);

-- method 4

CREATE TABLE Student
(
	Roll CHAR(4),
    Name VARCHAR(50),
    Email VARCHAR(60),
    Address VARCHAR(255),
    Age INT,
    Constraint pk_rule PRIMARY KEY(Roll),
    Constraint unique_rule UNIQUE(Email),
    Constraint checking_rule CHECK(Age > 10)
);

-- insert

INSERT INTO Student(Roll, Name, Email, Address, age) VALUES ('1', 'Tahdi Islam', 'tshdi60@gmail.com', 'Ramgonj, Lakshmipur', 22);
INSERT INTO Student(Roll, Name, Email, age) VALUES('3', 'tahdi', 'tahdi@gamil', 12);

-- foreign key

CREATE TABLE Library
(
	BookName VARCHAR(50) PRIMARY KEY,
    WhoHired_Roll CHAR(4),
    FOREIGN KEY(WhoHired_Roll) REFERENCES Student(Roll)
);

INSERT INTO Library(BookName, WhoHired_Roll) VALUES ('sql book', '1');

-- composite primary key

CREATE TABLE Course
(
	CourseName VARCHAR(10),
    University VARCHAR(10),
    Credit int,
    PRIMARY KEY(CourseName, University)
);