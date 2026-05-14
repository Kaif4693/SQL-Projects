--SQL_PROJECT_1

CREATE DATABASE HR_DATABASE_MANAGEMENT;

USE HR_DATABASE_MANAGEMENT;

CREATE TABLE regions 
(region_id INT PRIMARY KEY,
region_name VARCHAR (25) DEFAULT NULL);

CREATE TABLE countries 
(country_id CHAR (2) PRIMARY KEY,
country_name VARCHAR (40) DEFAULT NULL,
region_id INT NOT NULL,
FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE
CASCADE ON UPDATE CASCADE);

CREATE TABLE locations 
(location_id INT PRIMARY KEY,
street_address VARCHAR (40) DEFAULT NULL,
postal_code VARCHAR (12) DEFAULT NULL,
city VARCHAR (30) NOT NULL,
state_province VARCHAR (25) DEFAULT NULL,
country_id CHAR (2) NOT NULL,
FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE
CASCADE ON UPDATE CASCADE);

CREATE TABLE jobs (
job_id INT PRIMARY KEY,
job_title VARCHAR (35) NOT NULL,
min_salary DECIMAL (8, 2) DEFAULT NULL,
max_salary DECIMAL (8, 2) DEFAULT NULL);

CREATE TABLE departments (
department_id INT PRIMARY KEY,
department_name VARCHAR (30) NOT NULL,
location_id INT DEFAULT NULL,
FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE
CASCADE ON UPDATE CASCADE);

CREATE TABLE employees 
(employee_id INT PRIMARY KEY,
first_name VARCHAR (20) DEFAULT NULL,
last_name VARCHAR (25) NOT NULL,
email VARCHAR (100) NOT NULL,
phone_number VARCHAR (20) DEFAULT NULL,
hire_date DATE NOT NULL,
job_id INT NOT NULL,
salary DECIMAL (8, 2) NOT NULL,
manager_id INT DEFAULT NULL,
department_id INT DEFAULT NULL,
FOREIGN KEY (job_id) REFERENCES jobs (job_id) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (department_id) REFERENCES departments (department_id) 
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
ON DELETE NO ACTION ON UPDATE NO ACTION);


CREATE TABLE dependents 
(dependent_id INT PRIMARY KEY,
first_name VARCHAR (50) NOT NULL,
last_name VARCHAR (50) NOT NULL,
relationship VARCHAR (25) NOT NULL,
employee_id INT NOT NULL,
FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE
CASCADE ON UPDATE CASCADE);

--REGIONS DATA
INSERT INTO regions(region_id,region_name)
VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name)
VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name)
VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name)
VALUES (4,'Middle East and Africa');

SELECT * FROM regions;

--COUNTRIES DATA
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id)
VALUES ('ZW','Zimbabwe',4);

SELECT * FROM countries;

--LOCATIONS DATA 
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id)
VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

SELECT * FROM locations;

--JOBS DATA 
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary)
VALUES (19,'Stock Manager',5500.00,8500.00);

SELECT * FROM jobs;

--DEPARTMENTS DATA 
INSERT INTO departments(department_id,department_name,location_id)
VALUES (1,'Administration',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (2,'Marketing',1800);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (3,'Purchasing',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (4,'Human Resources',2400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (5,'Shipping',1500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (6,'IT',1400);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (7,'Public Relations',2700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (8,'Sales',2500);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (9,'Executive',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (10,'Finance',1700);
INSERT INTO departments(department_id,department_name,location_id)
VALUES (11,'Accounting',1700);

SELECT * FROM departments;

--EMPLOYEES DATA 
SET DATEFORMAT ymd;

INSERT INTO employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES
(100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','19870617',4,24000.00,NULL,9),
(101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','19890921',5,17000.00,100,9),
(102,'Lex','De Haan','lex.dehaan@sqltutorial.org','515.123.4569','19930113',5,17000.00,100,9),
(103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','19900103',9,9000.00,102,6),
(104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','19910521',9,6000.00,103,6),
(105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','19970625',9,4800.00,103,6),
(106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','19980205',9,4800.00,103,6),
(107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','19990207',9,4200.00,103,6),
(108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','19940817',7,12000.00,101,10),
(109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','19940816',6,9000.00,108,10),
(111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','19970930',6,7700.00,108,10),
(112,'Jose Manuel','Urman','jose.manuel.urman@sqltutorial.org','515.124.4469','19980307',6,7800.00,108,10),
(113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','19991207',6,6900.00,108,10),
(114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','19941207',14,11000.00,100,3),
(115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','19950518',13,3100.00,114,3),
(116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','19971224',13,2900.00,114,3),
(117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','19970724',13,2800.00,114,3),
(118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','19981115',13,2600.00,114,3),
(119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','19990810',13,2500.00,114,3),
(120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','19960718',19,8000.00,100,5),
(121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','19970410',19,8200.00,100,5),
(122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','19950501',19,7900.00,100,5),
(123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','19971010',19,6500.00,100,5),
(126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','19980928',18,2700.00,120,5),
(145,'John','Russell','john.russell@sqltutorial.org',NULL,'19961001',15,14000.00,100,8),
(146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'19970105',15,13500.00,100,8),
(176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'19980324',16,8600.00,100,8),
(177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'19980423',16,8400.00,100,8),
(178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'19990524',16,7000.00,100,8),
(179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'20000104',16,6200.00,100,8),
(192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','19960204',17,4000.00,123,5),
(193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','19970303',17,3900.00,123,5),
(200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','19870917',3,4400.00,101,1),
(201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','19960217',10,13000.00,100,2),
(202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','19970817',11,6000.00,201,2),
(203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','19940607',8,6500.00,101,4),
(204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','19940607',12,10000.00,101,7),
(205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','19940607',2,12000.00,101,11);

INSERT INTO employees
(employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, manager_id, department_id)
VALUES
(206,'Dummy','Employee','dummy.employee@sqltutorial.org',NULL,'20000101',1,3000,NULL,1);

SELECT * FROM employees;

--DEPENDENTS DATA 
INSERT INTO dependents
(dependent_id, first_name, last_name, relationship, employee_id)
VALUES
(1,'Penelope','Gietz','Child',206),
(2,'Nick','Higgins','Child',205),
(3,'Ed','Whalen','Child',200),
(4,'Jennifer','King','Child',100),
(5,'Johnny','Kochhar','Child',101),
(6,'Bette','De Haan','Child',102),
(7,'Grace','Faviet','Child',109),
(8,'Matthew','Chen','Child',109),
(9,'Joe','Sciarra','Child',111),
(10,'Christian','Urman','Child',112),
(11,'Zero','Popp','Child',113),
(12,'Karl','Greenberg','Child',108),
(13,'Uma','Mavris','Child',203),
(14,'Vivien','Hunold','Child',103),
(15,'Cuba','Ernst','Child',104),
(16,'Fred','Austin','Child',105),
(17,'Helen','Pataballa','Child',106),
(18,'Dan','Lorentz','Child',107),
(19,'Bob','Hartstein','Child',201),
(20,'Lucille','Fay','Child',202),
(21,'Kirsten','Baer','Child',204),
(22,'Elvis','Khoo','Child',115),
(23,'Sandra','Baida','Child',116),
(24,'Cameron','Tobias','Child',117),
(25,'Kevin','Himuro','Child',118),
(26,'Rip','Colmenares','Child',119),
(27,'Julia','Raphaely','Child',114),
(28,'Woody','Russell','Child',145),
(29,'Alec','Partners','Child',146),
(30,'Sandra','Taylor','Child',176);

SELECT * FROM dependents;

--TASK 1
--1)
--QA)
SELECT * FROM employees;

--QB)
SELECT employee_id, first_name,last_name,hire_date FROM employees;

--QC)
SELECT first_name,last_name,salary,salary*2 AS New_salary FROM employees;

--QD)
SELECT salary,salary*2 AS New_Salary From employees;

--2)
--QA)
SELECT employee_id, first_name, last_name, hire_date, salary
FROM employees ORDER BY employee_id;

--QB)
SELECT * FROM employees
ORDER BY first_name ASC;

--QC)
SELECT * FROM employees ORDER BY first_name ASC, last_name DESC;

--QD)
SELECT * FROM employees ORDER BY salary DESC;

--QE)
SELECT * FROM employees ORDER BY hire_date;

--QF)
SELECT * FROM employees ORDER BY hire_date DESC;

--3)
--QA)
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC;

--QB)
SELECT DISTINCT salary FROM employees;

--QC)
SELECT job_id, salary FROM employees;

--QD)
SELECT DISTINCT job_id, salary FROM employees;

--QE)
SELECT DISTINCT phone_number FROM employees
WHERE phone_number IS NOT NULL;

--4)
--QA)
SELECT * FROM employees ORDER BY first_name;

--QB)
SELECT TOP 5*
FROM employees;

--QC)
SELECT * FROM employees ORDER BY employee_id
OFFSET 3 ROWS FETCH NEXT 5 ROWS ONLY;

--QD)
SELECT TOP 5* FROM employees
ORDER BY salary DESC;

--QE)
SELECT * FROM employees WHERE salary = (
SELECT DISTINCT salary FROM employees
ORDER BY salary DESC OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY
); 

--5)
--QA)
SELECT * FROM employees WHERE salary > 14000
ORDER BY salary DESC;

--QB)
SELECT * FROM employees WHERE department_id = 5;

--QC)
SELECT * FROM employees WHERE last_name = 'Chen';

--QD) 
SELECT * FROM employees
WHERE hire_date > '1999-01-01';

--QE)
SELECT * FROM employees WHERE hire_date BETWEEN '1999-01-01' AND '1999-12-31';

--QF)
SELECT * FROM employees WHERE last_name = 'Himuro';

--QG)
SELECT * FROM employees WHERE last_name LIKE '%Himuro%';

--QH)
SELECT * FROM employees WHERE phone_number IS NULL;

--QI)
SELECT * FROM employees WHERE department_id <> 8;

--QJ)
SELECT * FROM employees WHERE department_id NOT IN (8,10);

--QK)
SELECT * FROM employees WHERE salary > 10000; 

--QL)
SELECT * FROM employees WHERE department_id = 8 AND salary > 10000;

--QM)
SELECT * FROM employees WHERE salary < 10000;

--QN)
SELECT * FROM employees WHERE salary >= 9000;

--QO)
SELECT * FROM employees WHERE salary <= 9000;

--6)
CREATE TABLE COURSE(
course_id INT PRIMARY KEY, 
course_name VARCHAR(50) NOT NULL
);

--QA)
ALTER TABLE course
ADD credit_hours INT;

--QB)
ALTER TABLE course ADD fee DECIMAL(8,2), max_limit INT;

--QC)
ALTER TABLE course ALTER COLUMN fee DECIMAL(8,2) NOT NULL;

--QD)
ALTER TABLE course DROP COLUMN fee;

--QE)
ALTER TABLE course 
DROP COLUMN max_limit, credit_hours;

--7)
CREATE TABLE project_milestones(
project_id INT PRIMARY KEY, project_name VARCHAR(100) NOT NULL,
start_date DATE, end_date DATE);

--QA)
ALTER TABLE project_milestones
ADD CONSTRAINT fk_project FOREIGN KEY (project_id)
REFERENCES project_milestones(project_id);

--QB)
ALTER TABLE project_milestones
ADD CONSTRAINT fk_project_id
FOREIGN KEY (project_id)
REFERENCES projects(project_id);

--TASK 2
--PART 1
--QA
SELECT * FROM employees
WHERE salary >5000 AND salary <7000;

--QB
SELECT * FROM employees WHERE salary
IN (7000,8000);

--QC
SELECT * FROM employees 
WHERE phone_number IS NULL;

--QD
SELECT * FROM employees
WHERE salary BETWEEN 9000 AND 12000;

--QE
SELECT * FROM employees
WHERE department_id IN (8,9);

--QF
SELECT * FROM employees
WHERE first_name LIKE 'jo%';

--QG
SELECT * FROM employees
WHERE first_name LIKE '_h%';

--QH
SELECT * FROM employees
WHERE salary >ALL (
SELECT salary FROM employees WHERE department_id = 8
);

--PART 2
--QA
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);

--QB
SELECT * FROM employees e
WHERE EXISTS (
SELECT 1 FROM dependents d 
WHERE d.employee_id = e.employee_id
);

--QC
SELECT * FROM employees
WHERE salary BETWEEN 2500 AND 2900;

--QD
SELECT * FROM employees
WHERE salary NOT BETWEEN 2500 AND 2900;

--QE
SELECT * FROM employees
WHERE hire_date BETWEEN '1999-01-01' AND '2000-12-31';

--QF
SELECT * FROM employees
WHERE hire_date NOT BETWEEN '1989-01-01' AND '1999-12-31';

--QG
SELECT * FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1993-12-31';

--PART 3
--QA
SELECT * FROM employees WHERE first_name LIKE 'Da%';

--QB
SELECT * FROM employees WHERE first_name LIKE '%er';

--QC
SELECT * FROM employees WHERE last_name LIKE '%an%';

--QD
SELECT * FROM employees WHERE first_name LIKE 'Jo__';

--QE
SELECT * FROM employees WHERE first_name LIKE '%_';

--QF
SELECT * FROM employees WHERE first_name LIKE 'S%' AND first_name NOT LIKE 'Sh%';

--PART 4
--QA
SELECT * FROM employees WHERE department_id = 5;

--QB
SELECT * FROM employees
WHERE department_id = 5 AND salary <= 5000;

--QC
SELECT * FROM employees
WHERE department_id NOT IN (1,2,3);

--QD
SELECT * FROM employees
WHERE first_name NOT LIKE 'D%';

--QE
SELECT * FROM employees
WHERE salary NOT BETWEEN 1000 AND 5000;

--PART 5
--QA
SELECT * FROM employees e
WHERE NOT EXISTS (
    SELECT 1 FROM dependents d
    WHERE d.employee_id = e.employee_id
);

--QB
SELECT * FROM employees WHERE phone_number IS NULL;

--QC
SELECT * FROM employees WHERE phone_number IS NOT NULL;

--TASK 3
--1
--A
SELECT * FROM departments WHERE department_id IN (1,2,3);

--B
SELECT e.*
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IN (1,2,3);

--C
SELECT e.first_name, e.last_name, j.job_title, d.department_name
FROM employees e
JOIN jobs j ON e.job_id = j.job_id
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id IN (1,2,3);

--LEFT JOIN
--1
SELECT country_name FROM countries
WHERE country_name IN ('United States of America','United Kingdom','China');

--2
SELECT l.*
FROM locations l
LEFT JOIN countries c
ON l.country_id = c.country_id
WHERE c.country_name IN ('United States of America','United Kingdom','China');

--3
SELECT c.country_name, l.city
FROM countries c
LEFT JOIN locations l
ON c.country_id = l.country_id;

--4
SELECT c.country_name
FROM countries c
LEFT JOIN locations l
ON c.country_id = l.country_id
WHERE l.location_id IS NULL;

--JOINING 3 TABLES
SELECT r.region_name, c.country_name, l.city
FROM regions r
JOIN countries c ON r.region_id = c.region_id
JOIN locations l ON c.country_id = l.country_id;

--SELF JOIN
SELECT e.first_name AS Employee, m.first_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

--FULL OUTER JOIN 
CREATE TABLE fruits(
fruit_id INT PRIMARY KEY,
fruit_name VARCHAR(255)NOT NULL,
basket_id INT
);

CREATE TABLE baskets(
basket_id INT PRIMARY KEY,
basket_name VARCHAR(255)NOT NULL
);

INSERT INTO baskets(basket_id,basket_name)
VALUES
(1,'A'),
(2,'B'),
(3,'C');

INSERT INTO fruits(fruit_id,fruit_name,basket_id)
VALUES
(1,'Apple',1),
(2,'Orange',1),
(3,'Banana',2),
(4,'Strawberry',NULL);

--QA
SELECT f.fruit_name, b.basket_name
FROM fruits f
FULL OUTER JOIN baskets b
ON f.basket_id = b.basket_id;

--QB
SELECT * FROM baskets b
LEFT JOIN fruits f
ON b.basket_id = f.basket_id
WHERE f.fruit_id IS NULL;

--QC
SELECT * FROM fruits
WHERE basket_id IS NULL;

--CROSS JOIN
CREATE TABLE sales_organisation(
sales_org_id INT PRIMARY KEY,
sales_org VARCHAR(255)
);

CREATE TABLE sale_channel(
channel_id INT PRIMARY KEY,
channel VARCHAR(255)
);

INSERT INTO sales_organisation(sales_org_id,sales_org)
VALUES
(1,'Domestic'),
(2,'Export');

INSERT INTO sale_channel(channel_id,channel)
VALUES
(1,'Wholesale'),
(2,'Retail'),
(3,'eCommerce'),
(4,'TV Shopping');

--Q
SELECT s.sales_org,c.channel
FROM sales_organisation s
CROSS JOIN sale_channel c;

--TASK 4
--QA
SELECT department_id FROM employees GROUP BY department_id;

--QB
SELECT department_id, COUNT(*) AS Emp_Count
FROM employees
GROUP BY department_id;

--QC
SELECT department_id, COUNT(*) AS Headcount
FROM employees
GROUP BY department_id
ORDER BY Headcount DESC;

--QD
SELECT department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--QE
SELECT department_id,
MIN(salary), MAX(salary), AVG(salary)
FROM employees
GROUP BY department_id;

--QF
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

--QG
SELECT department_id, job_id, COUNT(*)
FROM employees
GROUP BY department_id, job_id;

--HAVING CLAUSE
--QA
SELECT manager_id, COUNT(*) AS Reports
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

--QB
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(*) >= 5;

--QC
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) BETWEEN 20000 AND 30000;

--QD
SELECT department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 10000;

--QE
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) BETWEEN 5000 AND 7000;

--TASK 5
--1) SQL UNION OPERATER
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM dependents;

--2) SQL INTERSECT OPERATER
SELECT employee_id FROM employees
INTERSECT
SELECT employee_id FROM dependents
ORDER BY employee_id DESC;

--3) SQL EXISTS OPERATER
--QA
SELECT * FROM employees e
WHERE EXISTS (
SELECT 1 FROM dependents d
WHERE d.employee_id = e.employee_id
);

--QB
SELECT * FROM employees e
WHERE NOT EXISTS (
SELECT 1 FROM dependents d
WHERE d.employee_id = e.employee_id
);

--4) SQL CASE EXPRESSION
--QA
SELECT first_name,
YEAR(2000 - YEAR(hire_date)) AS Anniversary
FROM employees;

--QB
SELECT first_name, salary,
CASE
 WHEN salary < 3000 THEN 'Low'
 WHEN salary BETWEEN 3000 AND 5000 THEN 'Average'
 ELSE 'High'
END AS Salary_Level
FROM employees;

--5) SQL UPDATE STATEMENT
UPDATE employees
SET last_name = 'Lopez'
WHERE employee_id = 192;

--FINAL TASK 
--QA
SELECT * FROM employees
WHERE department_id IN (
    SELECT department_id FROM departments WHERE location_id = 1700
);

--QB
SELECT * FROM employees
WHERE department_id NOT IN (
    SELECT department_id FROM departments WHERE location_id = 1700
);

--QC
SELECT * FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

--QD
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--QE
SELECT * FROM departments
WHERE department_id IN (
    SELECT department_id FROM employees WHERE salary > 10000
);

--QF
SELECT * FROM departments
WHERE department_id NOT IN (
    SELECT department_id FROM employees WHERE salary > 10000
);

--QG
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id;

--QH
SELECT * FROM employees
WHERE salary > ALL (
    SELECT MIN(salary) FROM employees GROUP BY department_id
);

--QI
SELECT * FROM employees
WHERE salary >= ALL (
    SELECT MAX(salary) FROM employees GROUP BY department_id
);

--QJ
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id;

--QK
SELECT AVG(avg_salary)
FROM (
    SELECT AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
) t;

--QL
SELECT salary,
(SELECT AVG(salary) FROM employees) AS AvgSalary,
salary - (SELECT AVG(salary) FROM employees) AS Difference
FROM employees;