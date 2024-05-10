CREATE DATABASE Practice_2;

USE Practice_2;

-- queation 1

CREATE TABLE Employee
(
	EmpId CHAR(5) PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Joining_Year YEAR NOT NULL,
    Birthday DATE,
    Designation VARCHAR(50) NOT NULL,
    Salary int NOT NULL,
    CONSTRAINT chk_birthday CHECK (YEAR(Birthday) < 2000)
);

-- insert data in employee table

INSERT INTO Employee
(EmpId, EmpName, Joining_Year, Birthday, Designation, Salary)
VALUES
('3334', 'Tahdi Islam', '2023', '1999-02-15', 'Web-developer', 50000);


-- question 2
-- In MySQL, a composite key is created by combining two or more columns to uniquely identify
-- each record in a table. example below:

CREATE TABLE Course
(
	Name VARCHAR(50),
    Credit INT NOT NULL,
    Univercity VARCHAR(100),
    PRIMARY KEY (Name, Univercity)
);

INSERT INTO Course
(Name, Credit, Univercity)
VALUES
('CSE1A', 2, 'KUET');

-- question 3

-- In MySQL, the LIMIT clause in commonly used to restrict the number of rows
-- returned by a quary. However, it does not directly handle 
-- pagination or offsetting. To achieve pagination with an alter
-- offset, we can handle the limit clause along with the offset feature. 
-- Example below

-- first example with offset 
SELECT * FROM Course LIMIT 2 OFFSET 2;

-- second example without offset
SELECT * FROM Course LIMIT 4, 2;