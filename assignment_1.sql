CREATE DATABASE Assignment;

USE Assignment;

CREATE TABLE Student
(
	Roll CHAR(4) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    Address VARCHAR(255) NOT NULL,
    Age INT CHECK (Age>5),
    Class INT NOT NULL
);

CREATE TABLE Library
(
	BookId CHAR(5) PRIMARY KEY,
    BookName VARCHAR(150) NOT NULL,
    Hired_Roll CHAR(4),
    FOREIGN KEY (Hired_Roll) REFERENCES Student(Roll)
);

CREATE TABLE Fees
(
	Transaction_id CHAR(10) PRIMARY KEY,
	Amount INT NOT NULL,
    Student_Roll CHAR(4),
    FOREIGN KEY (Student_Roll) REFERENCES Student(Roll)
);

CREATE TABLE Employee
(
	EmployeeID CHAR(5) PRIMARY KEY,
    FirstName VARCHAR(20) NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    Age INT NOT NULL,
    Department VARCHAR(40) NOT NULL
);

INSERT INTO Employee
(EmployeeID, FirstName, LastName, Age, Department)
VALUES
('1', 'John', 'Doe', 28, 'Sales'),
('2', 'Jane', 'Smith', 32, 'Marketing'),
('3', 'Micheal', 'Johnson', 35, 'Finance'),
('4', 'Sarah', 'Brown', 30, 'HR'),
('5', 'William', 'Davis', 25, 'Engineering'),
('6', 'Emily', 'Wilson', 28, 'Sales'),
('7', 'Robert', 'Lee', 33, 'Marketing'),
('8', 'Laura', 'Hall', 29, 'Finance'),
('9', 'Thomas', 'White', 31, 'HR'),
('10', 'Olivia', 'Clark', 27, 'Engineering');

-- q5 Write a query to show the distinct department names

SELECT DISTINCT Department FROM Employee;

-- q6 Write a query to show the LastNames of the employees sorted by descending ages

SELECT LastName FROM Employee ORDER BY Age DESC;

-- q7 Write a query to show the employee LastName whose age is greater 
-- than 30 and works in Marketing department.

SELECT LastName FROM Employee WHERE Age>30 AND Department = 'Marketing';

-- q8 Write a query to select all the employees

SELECT * FROM Employee;

-- q9 Write a query to get employees whose names includes ‘son’

SELECT * FROM Employee WHERE FirstName LIKE '%son%' OR LastName LIKE '%son%';

-- q10 Write a query to get the engineers

SELECT * FROM Employee WHERE Department = 'Engineering';

-- SET SQL_SAFE_UPDATES = 0;
-- UPDATE Student
-- SET Name = 'Tahdi'
-- WHERE Roll = 1;
-- SET SQL_SAFE_UPDATES = 1;

-- q4 In MySQL, Update and Delete query wasn’t executing, what was the reason 
-- and how to run those query? Write the code to enable the feature. 
-- (If you followed the class, you should know this).

SET SQL_SAFE_UPDATES = 0;
UPDATE Employee
SET Department = 'Sales'
WHERE EmployeeID = '6';
