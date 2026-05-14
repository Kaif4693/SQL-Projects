--SQL_ASSIGNMENT_4

CREATE DATABASE Customer_Orders_Products;

USE Customer_Orders_Products;

CREATE TABLE Customers  
(CustomerID INT PRIMARY KEY,
Name VARCHAR(50),
Email VARCHAR(100));

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
ProductName VARCHAR(50),
OrderDate DATE,
Quantity INT,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Price DECIMAL(10, 2)
);

--CUSTOMERS TABLE 
INSERT INTO Customers (CustomerID, Name, Email)
VALUES
(1, 'John Doe', 'johndoe@example.com'),
(2, 'Jane Smith', 'janesmith@example.com'),
(3, 'Robert Johnson', 'robertjohnson@example.com'),
(4, 'Emily Brown', 'emilybrown@example.com'),
(5, 'Michael Davis', 'michaeldavis@example.com'),
(6, 'Sarah Wilson', 'sarahwilson@example.com'),
(7, 'David Thompson', 'davidthompson@example.com'),
(8, 'Jessica Lee', 'jessicalee@example.com'),
(9, 'William Turner', 'williamturner@example.com'),
(10, 'Olivia Martinez', 'oliviamartinez@example.com'),
(11, 'James Anderson', 'jamesanderson@example.com'),
(12, 'Kelly Clarkson', 'kellyclarkson@example.com');

SELECT * FROM Customers;

--PRODUCTS TABLE 
INSERT INTO Products (ProductID, ProductName, Price)
VALUES
(1, 'Product A', 10.99),
(2, 'Product B', 8.99),
(3, 'Product C', 5.99),
(4, 'Product D', 12.99),
(5, 'Product E', 7.99),
(6, 'Product F', 6.99),
(7, 'Product G', 9.99),
(8, 'Product H', 11.99),
(9, 'Product I', 14.99),
(10, 'Product J', 4.99),
(11, 'Product K', 3.99),
(12, 'Product L', 15.99);

SELECT * FROM Products;

--ORDERS TABLE 
INSERT INTO Orders (OrderID, CustomerID, ProductName, OrderDate, Quantity)
VALUES
(1, 1, 'Product A', '2023-07-01', 5),
(2, 2, 'Product B', '2023-07-02', 3),
(3, 3, 'Product C', '2023-07-03', 2),
(4, 4, 'Product A', '2023-07-04', 1),
(5, 5, 'Product B', '2023-07-05', 4),
(6, 6, 'Product C', '2023-07-06', 2),
(7, 7, 'Product A', '2023-07-07', 3),
(8, 8, 'Product B', '2023-07-08', 2),
(9, 9, 'Product C', '2023-07-09', 5),
(10, 10, 'Product A', '2023-07-10', 1),
(11, 11, 'Product D', '2023-07-10', 3),
(12, 12, 'Product E', '2023-07-11', 6),
(13, 5, 'Product G', '2023-07-12', 2),
(14, 4, 'Product H', '2023-07-13', 4),
(15, 6, 'Product I', '2023-07-14', 3);

SELECT * FROM Orders;

--ASSIGNMENT ANSWERS 
--TASK 1
--Q1
SELECT * FROM Customers;

--Q2
SELECT Name, Email
FROM Customers
WHERE Name LIKE 'J%';

--Q3
SELECT OrderID, ProductName, Quantity
FROM Orders;

--Q4
SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;

--Q5
SELECT DISTINCT c.Name
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID;

--Q6
SELECT *
FROM Products
WHERE Price > 10;

--Q7
SELECT c.Name, o.OrderDate
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '2023-07-05';

--Q8
SELECT AVG(Price) AS AveragePrice
FROM Products;

--Q9
SELECT c.Name, SUM(o.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

--Q10
SELECT * FROM Products
WHERE ProductName NOT IN 
(SELECT ProductName FROM Orders);

--TASK 2
--Q1
SELECT TOP 5 c.Name, SUM(o.Quantity) AS TotalQuantity
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.Name
ORDER BY TotalQuantity DESC;

--Q2
SELECT AVG(Price) AS AveragePrice
FROM Products;

--Q3
SELECT * FROM Customers
WHERE CustomerID NOT IN 
(SELECT CustomerID FROM Orders);

--Q4
SELECT o.OrderID, o.ProductName, o.Quantity
FROM Orders o
JOIN Customers c 
ON o.CustomerID = c.CustomerID
WHERE c.Name LIKE 'M%';

--Q5
SELECT SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Products p 
ON o.ProductName = p.ProductName;

--Q6
SELECT c.Name, 
SUM(o.Quantity * p.Price) AS TotalRevenue FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
JOIN Products p 
ON o.ProductName = p.ProductName
GROUP BY c.Name;

--Q7
SELECT c.CustomerID, c.Name
FROM Customers c
JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(DISTINCT o.ProductName) =
(SELECT COUNT(*) FROM Products);

--Q8
SELECT DISTINCT c.Name FROM Customers c
JOIN Orders o1 
ON c.CustomerID = o1.CustomerID
JOIN Orders o2 
ON o1.CustomerID = o2.CustomerID
AND DATEDIFF(DAY, o1.OrderDate, o2.OrderDate) = 1;

--Q9
SELECT TOP 3 ProductName,
AVG(Quantity) AS AvgQuantity
FROM Orders
GROUP BY ProductName
ORDER BY AvgQuantity DESC;

--Q10
SELECT 
COUNT(CASE WHEN Quantity > AvgQty THEN 1 END) * 100.0 / COUNT(*) 
AS PercentageGreaterThanAverage
FROM Orders
CROSS JOIN 
(SELECT AVG(Quantity) AS AvgQty 
FROM Orders) AS A;