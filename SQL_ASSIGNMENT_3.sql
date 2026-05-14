--SQL_ASSIGNMENTS_3

CREATE DATABASE SQL_ASSIGNMENTS_3;

USE SQL_ASSIGNMENTS_3;

CREATE TABLE students (
    studentId INT NOT NULL,
    name VARCHAR(50),
    surname VARCHAR(50),
    birthdate DATE,
    gender CHAR(1),
    class VARCHAR(10),
    point INT,
    PRIMARY KEY (studentId)
);

CREATE TABLE authors (
    authorId INT NOT NULL,
    name VARCHAR(50),
    surname VARCHAR(50),
    PRIMARY KEY (authorId)
);

CREATE TABLE types (
    typeId INT NOT NULL,
    name VARCHAR(50),
    PRIMARY KEY (typeId)
);

CREATE TABLE books (
    bookId INT NOT NULL,
    name VARCHAR(100),
    pagecount INT,
    point INT,
    authorId INT,
    typeId INT,
    PRIMARY KEY (bookId),
    CONSTRAINT fk_author
        FOREIGN KEY (authorId) REFERENCES authors(authorId),
    CONSTRAINT fk_type
        FOREIGN KEY (typeId) REFERENCES types(typeId)
);

CREATE TABLE borrows (
    borrowId INT NOT NULL,
    studentId INT,
    bookId INT,
    takenDate DATE,
    broughtDate DATE,
    PRIMARY KEY (borrowId),
    CONSTRAINT fk_student
        FOREIGN KEY (studentId) REFERENCES students(studentId),
    CONSTRAINT fk_book
        FOREIGN KEY (bookId) REFERENCES books(bookId)
);

--STUDENTS
INSERT INTO students (studentId, name, surname,
birthdate, gender, class, point) VALUES
(1, 'John', 'Doe', '2005-01-15', 'M', '10A', 85),
(2, 'Jane', 'Smith', '2006-03-22', 'F', '10B', 90),
(3, 'Alice', 'Johnson', '2005-07-12', 'F', '10A', 88),
(4, 'Bob', 'Brown', '2006-11-30', 'M', '10C', 76),
(5, 'Charlie', 'Davis', '2005-05-05', 'M', '10B', 92),
(6, 'Diana', 'Miller', '2006-06-25', 'F', '10C', 81),
(7, 'Eve', 'Wilson', '2005-09-18', 'F', '10A', 87),
(8, 'Frank', 'Moore', '2006-12-02', 'M', '10B', 80),
(9, 'Grace', 'Taylor', '2005-04-17', 'F', '10C', 83),
(10, 'Hank', 'Anderson', '2006-10-20', 'M', '10A', 78);

--AUTHORS
INSERT INTO authors (authorId, name, surname) VALUES
(1, 'F. Scott', 'Fitzgerald'),
(2, 'Harper', 'Lee'),
(3, 'George', 'Orwell'),
(4, 'Jane', 'Austen'),
(5, 'J.D.', 'Salinger'),
(6, 'J.R.R.', 'Tolkien'),
(7, 'Herman', 'Melville'),
(8, 'Leo', 'Tolstoy'),
(9, 'James', 'Joyce'),
(10, 'Homer', '');

--TYPES
INSERT INTO types (typeId, name) VALUES
(1, 'Fiction'),
(2, 'Classic'),
(3, 'Dystopian'),
(4, 'Literature'),
(5, 'Fantasy'),
(6, 'Adventure'),
(7, 'Historical Fiction'),
(8, 'Science Fiction'),
(9, 'Mythology'),
(10, 'Philosophy');

--BOOKS 
INSERT INTO books (bookId, name, pagecount, point,
authorId, typeId) VALUES
(1, 'The Great Gatsby', 180, 95, 1, 1),
(2, 'To Kill a Mockingbird', 281, 90, 2, 2),
(3, '1984', 328, 88, 3, 3),
(4, 'Pride and Prejudice', 279, 93, 4, 4),
(5, 'The Catcher in the Rye', 214, 85, 5, 1),
(6, 'The Hobbit', 310, 91, 6, 2),
(7, 'Moby-Dick', 635, 80, 7, 3),
(8, 'War and Peace', 1225, 92, 8, 4),
(9, 'Ulysses', 730, 89, 9, 1),
(10, 'The Odyssey', 541, 87, 10, 2);

--BORROWS 
INSERT INTO borrows (borrowId, studentId, bookId,
takenDate, broughtDate) VALUES
(1, 1, 3, '2024-01-10', '2024-01-20'),
(2, 2, 5, '2024-01-12', '2024-01-22'),
(3, 3, 7, '2024-01-15', '2024-01-25'),
(4, 4, 2, '2024-01-18', '2024-01-28'),
(5, 5, 1, '2024-01-20', '2024-01-30'),
(6, 6, 4, '2024-01-22', '2024-02-01'),
(7, 7, 6, '2024-01-24', '2024-02-03'),
(8, 8, 8, '2024-01-26', '2024-02-05'),
(9, 9, 10, '2024-01-28', '2024-02-07'),
(10, 10, 9, '2024-01-30', '2024-02-09');

--ASSIGNMENTS ANSWERS
--Q1
SELECT * FROM students;

--Q2
SELECT name, surname, class FROM students;

--Q3
SELECT * FROM students WHERE gender = 'f';

--Q4
SELECT DISTINCT CLASS FROM students;

--Q5
SELECT * FROM students WHERE 
gender = 'F' AND class = '10MATH';

--Q6
SELECT name, surname, class
FROM students WHERE class IN ('10Math', '10Sci');

--Q7
SELECT name, surname, studentid FROM students;

--Q8
SELECT CONCAT(name,' ', surname ) AS Fullname 
FROM students;

--Q9
SELECT * FROM students WHERE name LIKE 'A%';

--Q10
SELECT name, pagecount FROM books WHERE pagecount BETWEEN 50 AND 200;

--Q11
SELECT * FROM students WHERE name IN ('Emma','Sophia','Robert'); 

--Q12
SELECT * FROM students WHERE name LIKE 'A%'
OR name LIKE 'D%' OR name LIKE 'K%';

--Q13
SELECT name,surname,class,gender FROM students WHERE (gender = 'M' AND class = '9Math')
OR (gender = 'F'AND class = '9His');

--Q14
SELECT * FROM students WHERE gender = 'M' AND class IN ('10Math','10Bio');

--Q15
SELECT * FROM students WHERE YEAR(birthdate) = 1989;

--Q16
SELECT * FROM students WHERE gender='F' AND studentId BETWEEN 30 AND 50;

--Q17
SELECT * FROM students ORDER BY name;

--Q18
SELECT * FROM students ORDER BY name, surname; 

--Q19
SELECT * FROM students WHERE class = '10Math'
ORDER BY studentId DESC;

--Q20
SELECT TOP 10 * FROM students;

--Q21
SELECT TOP 10 name, surname, birthdate FROM students;

--Q22
SELECT TOP 1 * FROM books 
ORDER BY pagecount DESC;

--Q23
SELECT TOP 1 * FROM students 
ORDER BY birthdate DESC;

--Q24
SELECT TOP 1 * FROM students WHERE class = '10Math'
ORDER BY birthdate ASC;

--Q25
SELECT * FROM books 
WHERE name LIKE 'N%';

--Q26
SELECT class, COUNT(*) AS TotalStudents FROM students
GROUP BY class;

--Q27
SELECT * FROM students 
ORDER BY NEWID();

--Q28
SELECT TOP 1 * FROM students 
ORDER BY NEWID();

--Q29
SELECT TOP 1 name, surname, studentId FROM students
WHERE class = '10Math'
ORDER BY NEWID();

--Q30
INSERT INTO authors (authorId, name, surname)
VALUES (11, 'Smith', 'Allen');

--Q31
INSERT INTO types (typeId, name)
VALUES (11, 'Biography'); 

--Q32
INSERT INTO students (studentId, name, surname, gender, class)
VALUES 
(11, 'Thomas', 'Nelson', 'M', '10Math'),
(12, 'Sally', 'Allen', 'F', '9Bio'),
(13, 'Linda', 'Sandra', 'F', '11His');

--Q33
INSERT INTO authors (authorId, name, surname)
SELECT TOP 1 s.studentId, s.name, s.surname
FROM students s
WHERE NOT EXISTS (SELECT 1 
FROM authors a 
WHERE a.authorId = s.studentId)
ORDER BY NEWID();

--Q34
INSERT INTO authors (authorId, name, surname)
SELECT s.studentId, s.name, s.surname
FROM students s
WHERE s.studentId BETWEEN 10 AND 30
AND NOT EXISTS 
(SELECT 1
FROM authors a
WHERE a.authorId = s.studentId);

--Q35
INSERT INTO authors (authorId, name, surname)
VALUES ((SELECT MAX(authorId)+1 FROM authors), 'Cindy', 'Brown');

--Q36
UPDATE students SET class = '10His'
WHERE studentId = 3;

--Q37
UPDATE students SET class = '10Math'
WHERE class = '9Math';

--Q38
UPDATE students 
SET point = point + 5;

--Q39
DELETE FROM authors 
WHERE authorId = 25;

--Q40
SELECT * FROM students 
WHERE birthdate IS NULL;

--Q41
SELECT 
s.name,
s.surname,
b.takenDate,
b.broughtDate
FROM students s
JOIN borrows b ON s.studentId = b.studentId;