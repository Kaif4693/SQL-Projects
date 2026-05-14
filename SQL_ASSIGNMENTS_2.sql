--SQL_Assignments_2

CREATE DATABASE SQL_ASSIGNMENTS_2;

USE SQL_ASSIGNMENTS_2;

CREATE TABLE EmployeeDetails
(Empid INT PRIMARY KEY,
FullName VARCHAR(100),
ManagerId INT,
DateOfJoining DATE,
City VARCHAR(100)
);

CREATE TABLE EmployeeSalary
(EmpId INT,
Project VARCHAR(50),
Salary DECIMAL(10,2),
Variable DECIMAL(10,2),
FOREIGN KEY (EmpID) REFERENCES
EmployeeDetails(EmpId)
);
USE SQL_ASSIGNMENTS_2;

INSERT INTO EmployeeDetails(Empid,FullName,ManagerId,DateOfJoining,City)VALUES
(101,'Alice Johnson',321,'2022-05-15','New York'),
(102,'Bob Smith',876,'2020-03-12','Los Angeles'),
(103,'Charlie Brown',986,'2021-08-23','Chicago'),
(104,'David Williams',876,'2019-11-05','Houston'),
(105,'Eve Davis',321,'2023-01-07','Phoenix'),
(106,'Frank Muller',986,'2018-12-19','Philadelphia'),
(107,'Grace Wilson',876,'2022-03-28','San Antonio'),
(108,'Hank Moore',321,'2021-09-14','San Diego'),
(109,'Ivy Taylor',986,'2020-02-11','Dallas'),
(110,'Jack Anderson',876,'2022-11-30','San Jose'),
(111,'Karen Thomas',321,'2021-07-16','Austin'),
(112,'Liam Jackson',986,'2023-04-21','Forth Worth'),
(113,'Mia White',876,'2019-06-03','Columbus'),
(114,'Noah Harris',321,'2020-12-10','Charlotte'),
(115,'Olivia Martin',986,'2021-10-25','San Francisco'),
(116,'Paul Garcia',876,'2023-07-18','Indianapolis'),
(117,'Quinn Martinez',321,'2022-09-07','Seattle'),
(118,'Rachel Rodriguez',986,'2020-01-15','Denver'),
(119,'Steve Clark',876,'2021-03-19','Washington'),
(120,'Tina Lewis',321,'2019-08-31','Boston')

SELECT * FROM EmployeeDetails;

INSERT INTO EmployeeSalary(EmpId,Project,Salary,Variable)VALUES
(101,'P1',7500,500),
(102,'P2',9200,700),
(103,'P1',6700,600),
(104,'P3',8300,900),
(105,'P2',7800,800),
(106,'P3',9100,1000),
(107,'P1',6200,400),
(108,'P2',8800,750),
(109,'P3',9500,1100),
(110,'P1',7200,650),
(111,'P2',8700,850),
(112,'P3',9300,1200),
(113,'P1',7900,550),
(114,'P2',6800,450),
(115,'P3',8400,900),
(116,'P1',7600,500),
(117,'P2',8900,1000),
(118,'P3',9200,1100),
(119,'P1',8100,600),
(120,'P2',8300,750);

SELECT * FROM EmployeeSalary;

--PART-1

--Q1)
SELECT EmployeeDetails.*
FROM EmployeeDetails
LEFT JOIN EmployeeSalary
ON EmployeeDetails.Empid = EmployeeSalary.EmpId
WHERE EmployeeSalary.EmpId IS NULL;

--Q2)
SELECT EmployeeDetails.*
FROM EmployeeDetails 
LEFT JOIN EmployeeSalary
ON EmployeeDetails.Empid = EmployeeSalary.EmpId
WHERE EmployeeSalary.EmpId IS NULL;

--Q3)
SELECT *
FROM EmployeeDetails
WHERE YEAR(DateOfJoining)=2020;

--Q4)
SELECT EmployeeDetails.*
FROM EmployeeDetails
INNER JOIN EmployeeSalary
ON EmployeeDetails.Empid = EmployeeSalary.EmpId;

--Q5)
SELECT Project, COUNT(DISTINCT Empid) AS EmployeeCount
FROM EmployeeSalary GROUP BY Project;

--Q6)
SELECT EmployeeDetails.FullName, EmployeeSalary.Salary
FROM EmployeeDetails 
LEFT JOIN EmployeeSalary ON EmployeeDetails.Empid = EmployeeSalary.EmpId;

--Q7)
SELECT DISTINCT EmployeeDetails.*
FROM EmployeeDetails
WHERE EmployeeDetails.Empid IN (
SELECT ManagerId
FROM EmployeeDetails
WHERE ManagerId IS NOT NULL
);

--Q8)
SELECT FullName, ManagerId, DateOfJoining, City, COUNT(*) AS DuplicateCount
FROM EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

--Q9)
WITH OddRows AS (
    SELECT EmployeeDetails.*, 
           ROW_NUMBER() OVER (ORDER BY EmpId) AS RowNum
    FROM EmployeeDetails 
)
SELECT *
FROM OddRows
WHERE RowNum % 2 = 1;   -- odd rows only

--Q10)
SELECT DISTINCT Salary
FROM EmployeeSalary e1
WHERE 3 = (
   SELECT COUNT(DISTINCT Salary)
   FROM EmployeeSalary e2
   WHERE e2.Salary >= e1.Salary
);

--PART-2

--Q1)
Select Empid, Fullname
from EmployeeDetails
where ManagerId = 986;

--Q2)
Select Distinct project
from EmployeeSalary;

--Q3)
Select COUNT(*) As employee_count
from EmployeeSalary
where Project = 'P1';

--Q4)
SELECT 
MAX(Salary) as MaxSalary,
MIN(Salary) as Minsalary,
AVG(Salary) as AvgSalary
from EmployeeSalary;

--Q5)
SELECT EmpID 
FROM EmployeeSalary
WHERE Salary between 9000 AND 15000;

--Q6)
select * from EmployeeDetails
where City= 'toronto'
AND ManagerId= 321;

--Q7)
Select * From EmployeeDetails
where City= 'California'
Or ManagerId= 321;

--Q8)
Select * from EmployeeSalary
where Project <> 'P1';

--Q9)
Select Empid,(Salary + variable)
AS Totalsalary
from EmployeeSalary;

--Q10)
Select * from EmployeeDetails
where FullName like '__hn%';

--Part-3 
--Q1)
Select Empid from EmployeeDetails
union
Select Empid from EmployeeSalary;

--Q2)
Select a.*
from EmployeeDetails a
inner join EmployeeSalary b 
on a.Empid = b.EmpId;

--Q3)
Select * from EmployeeDetails
where Empid not in (Select Empid from EmployeeSalary);

--Q4)
Select a.Empid
from EmployeeDetails a
inner join EmployeeSalary b
on a.Empid = b.EmpId;

--Q5)
Select a.Empid from EmployeeDetails a
left join EmployeeSalary b on a.Empid = b.EmpId
where b.EmpId is Null;

--Q6)
Select REPLACE(Fullname,' ','_') as modifiedname
from EmployeeDetails;

--Q7)
Select CHARINDEX('a', Fullname) as position 
from EmployeeDetails;

--Q8)
Select CONCAT(Empid,'-',ManagerId) as Emp_Manager
from EmployeeDetails;

--Q9)
Select SUBSTRING(Fullname, 1, CHARINDEX(' ', Fullname) - 1)
as FirstName from EmployeeDetails; 

--Q10)
Select UPPER(Fullname) as EmployeeName_Uppercase,
LOWER(City) as City_LowerCase from EmployeeDetails;

--PART 4
--Q1)
SELECT LEN(FullName) - LEN (REPLACE(FullName,'n',' ')) AS totaloccurrences from EmployeeDetails;

--Q2)
UPDATE EmployeeDetails SET FullName = TRIM(FullName);

--Q3)
SELECT e.* FROM EmployeeDetails e
LEFT JOIN EmployeeSalary ep ON e.Empid = ep.Empid
WHERE ep.Empid IS NULL;

--Q4)
SELECT e.FullName, s.Salary 
From EmployeeDetails e
JOIN EmployeeSalary s ON e.Empid = s.EmpId 
Where s.Salary BETWEEN 5000 AND 10000;

--Q5)
SELECT CURRENT_TIMESTAMP;

--Q6)
SELECT * FROM EmployeeDetails 
WHERE YEAR(DateOfJoining) = 2020;

--Q7)
SELECT e.*
FROM EmployeeDetails e INNER JOIN EmployeeSalary s 
On e. Empid = s.EmpId;

--Q8)
SELECT Project,
       COUNT(EmpId) AS EmployeeCount
FROM EmployeeSalary
GROUP BY Project
ORDER BY EmployeeCount DESC;

--Q9)
SELECT e.EmpId, e.FullName, s.Salary, s.Project, s.Variable
From EmployeeDetails e LEFT JOIN EmployeeSalary s ON e.Empid = s.EmpId;

--Q10)
SELECT e.EmpId,
       e.FullName,
       s.Salary,
       ep.ProjectID
FROM EmployeeDetails e
INNER JOIN EmployeeSalary s
       ON e.EmpId = s.EmpId
INNER JOIN EmployeeProject ep
       ON e.EmpId = ep.EmployeeID;