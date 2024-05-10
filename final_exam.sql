CREATE TABLE Student (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    Phone VARCHAR(15),
    Address TEXT
);

CREATE TABLE Book (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(50),
    TotalCopies INT NOT NULL,
    AvailableCopies INT NOT NULL
);

CREATE TABLE Borrowing (
    BorrowID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ISBN VARCHAR(13),
    BorrowDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

USE FINAL_EXAM;

-- INSERT INTO Student (Name, Email, Phone, Address)
-- VALUES ('Roni', 'roni@example.com', '1232-4256-232', '123 Main St, hello, AB 0000');

-- INSERT INTO Book (ISBN, Title, Author, Genre, TotalCopies, AvailableCopies)
-- VALUES ('978-03074084', 'To Kill a Mockingbird', 'Harper Lee', 'Classic Fiction', 10, 8),
--        ('978-00624831', 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', 5, 3),
--        ('978-03160694', 'Pride and Prejudice', 'Jane Austen', 'Romance', 7, 5),
--        ('978-03453416', 'A Brief History of Time', 'Stephen Hawking', 'Science', 3, 1),
--        ('978-14088596', 'The Martian', 'Andy Weir', 'Science Fiction', 8, 6);


-- 2. Insert a new borrowing record for a student (e.g., StudentID 3)
-- for a book with the most available copies.

INSERT INTO BORROWING (STUDENTID, ISBN, BORROWDATE, DUEDATE, RETURNDATE)
	VALUES (3, (SELECT ISBN
				FROM BOOK
				WHERE TOTALCOPIES = 
                (SELECT MAX(TOTALCOPIES)
				FROM BOOK)),CURDATE(), "2024-04-1", "2024-04-1");
                
-- 3. Using Update Query, decrease the available copies of a book 
-- (e.g., ISBN '9781234567890') by 1 when a student borrows it.

-- UPDATE BOOK
-- SET TOTALCOPIES = TOTALCOPIES - 1
-- WHERE TOTALCOPIES = (SELECT MAX(TOTALCOPIES) FROM BOOK);

UPDATE Book
SET AVAILABLECOPIES = AVAILABLECOPIES - 1
WHERE ISBN = "978-03074084";

-- 4. Retrieve the names of students who have borrowed the most books.

SELECT STUDENT.NAME
FROM BORROWING JOIN STUDENT USING(STUDENTID)
GROUP BY STUDENTID
HAVING COUNT(*) = (SELECT COUNT(*) AS MX
					FROM BORROWING JOIN STUDENT USING(STUDENTID)
					GROUP BY STUDENTID
					ORDER BY MX DESC
					LIMIT 1);

-- 5 Retrieve the books that are overdue (i.e., the return date is before the current date).

SELECT BOOK.TITLE
FROM BORROWING JOIN BOOK USING(ISBN)
WHERE CURDATE() > RETURNDATE;

-- 7. Explain UNION and UNION ALL set operations in MySQL

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
UNION
SELECT *
FROM EMPLOYEES
WHERE SALARY > 10000;
-- in this example there will be all value exist but no duplicate

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 90
UNION ALL
SELECT *
FROM EMPLOYEES
WHERE SALARY > 10000;
-- in this example there is also all value exist but it also take the duplicates

-- 8. There is a table named Employee. In that table there is 
-- a field named Salary. Determine the second lowest salary.

USE DUMMYDB;

SELECT MIN(SALARY)
FROM EMPLOYEES
WHERE SALARY > (SELECT MIN(SALARY)
				FROM EMPLOYEES);
                
-- 9. There are tables named Employee, Job History, Department.
-- Use ON DELETE CASCADE on Job History for deleting Employee
-- Use ON DELETE SET NULL on Employee for deleting Department

CREATE TABLE DEPARTMENTS (
	DEPARTMENT_ID INT (11) UNSIGNED PRIMARY KEY,
	DEPARTMENT_NAME VARCHAR(30) NOT NULL,
	MANAGER_ID INT (11) UNSIGNED,
	LOCATION_ID INT (11) UNSIGNED
	);

CREATE TABLE EMPLOYEES (
	EMPLOYEE_ID INT (11) UNSIGNED PRIMARY KEY,
	NAME VARCHAR(255) NOT NULL,
	EMAIL VARCHAR(25) NOT NULL,
	HIRE_DATE DATE NOT NULL,
	JOB_ID VARCHAR(10) NOT NULL,
	SALARY DECIMAL(8, 2) NOT NULL,
	DEPARTMENT_ID INT (11) UNSIGNED,
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID)
		ON DELETE SET NULL
	);

CREATE TABLE JOB_HISTORY (
	EMPLOYEE_ID INT (11) UNSIGNED NOT NULL,
	START_DATE DATE NOT NULL,
	END_DATE DATE NOT NULL,
	JOB_ID VARCHAR(10) NOT NULL,
	DEPARTMENT_ID INT (11) UNSIGNED NOT NULL,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID)
		ON DELETE CASCADE
	);