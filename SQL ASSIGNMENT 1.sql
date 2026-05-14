--Assignment1
CREATE DATABASE Brands;
CREATE DATABASE Products;
 
 USE Brands;

 CREATE TABLE ITEMS_TABLE
 (
 ITEM_ID INT,
 ITEM_DESCRIPTION VARCHAR(MAX),
 VENDOR_NOS INT,
 VENDOR_NAME VARCHAR(MAX),
 BOTTEL_SIZE INT,
 BOTTLE_PRICE FLOAT
 );

 SELECT * FROM ITEMS_TABLE;

 INSERT INTO ITEMS_TABLE VALUES
 (1,'Travis hasse apple pie',305,'Mhw Ltd',750,9.77),
 (2,'Daristi Xtabentun', 391, 'Anchor Distilling(presis Impots)',750,14.12),
 (3,'Hiram WAlker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,6.5),
 (4,'Oak Cross Whisky',305,'Mhw Ltd',750,25.33),
 (5,'Uv Red (Cherry) Vodka',380,'Phillips Beverage Company',200,1.97),
 (6,'Heaven Hill Old Style White Label',259,'Heaven Hill Distilleries Inc.',750,6.37),
 (7,'Hyde Herbal Liqueur',194,'Fire Tail Brands LIc',750,5.06),
 (8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,23.61);

 SELECT * FROM ITEMS_TABLE;

 USE Products;

 CREATE TABLE PRODUCT_SALES_TABLE
 (
 Product_id INT,
 Country VARCHAR(MAX),
 Product VARCHAR(MAX),
 UnitsSold FLOAT,
 ManufacturingPrice INT,
 SalePrice INT,
 GrossSales INT,
 Sales INT,
 COGS INT,
 Profit INT,
 [Date] DATE,
 MonthNumber INT,
 MonthName VARCHAR(MAX),
 [Year] INT
 );

 SELECT * FROM PRODUCT_SALES_TABLE;

 INSERT INTO PRODUCT_SALES_TABLE VALUES;
 (1,'Canada','Carretera',1618.5,3,20,32370,32370,16185,16185,'1/1/2014',1,'January',2014),
 (2,'Germany','Carretera',1321,3,20,26420,26420,13210,13210,'1/1/2014',1,'January',2015),
 (3,'France','Carretera',2178,3,15,32670,32670,21780,10890,'6/1/2014',6,'June',2016),
 (4,'Germany','Carretera',888,3,15,13320,13320,8880,4440,'6/1/2014',6,'June',2017),
 (5,'Mexico','Carretera',2470,3,15,37050,37050,24700,12350,'6/1/2014',6,'June',2018),
 (6,'Germany','Carretera',1513,3,350,529550,529550,393380,136170,'12/1/2014',12,'December',2019),
 (7,'Germany','Montana',921,5,15,13815,13815,9210,4605,'3/1/2014',3,'March',2020),
 (8,'Canada','Montana',2518,5,12,30216,30216,7554,22662,'6/1/2014',6,'June',2021);


 --BASIC QUESTION 
 --Q4)
 DELETE FROM PRODUCT_SALES_TABLE WHERE UnitsSold IN (1618.5,888,2470);

 --Q5)
  SELECT * FROM ITEMS_TABLE;

  --Q6)
  SELECT ITEM_DESCRIPTION, BOTTLE_PRICE FROM ITEMS_TABLE;

  --Q7)
  SELECT ITEM_DESCRIPTION, BOTTLE_PRICE FROM ITEMS_TABLE; 
  WHERE BOTTLE_PRICE > 20


  USE Products;
  SELECT * FROM PRODUCT_SALES_TABLE;
  --Q8)
  SELECT DISTINCT COUNTRY FROM PRODUCT_SALES_TABLE;

  --Q9)
  SELECT COUNT(COUNTRY) AS TOTALCOUNTRIES FROM PRODUCT_SALES_TABLE;

  --Q10)
  SELECT COUNT(DISTINCT COUNTRY) AS COUNTRIESINRANGE FROM PRODUCT_SALES_TABLE
  WHERE SalePrice BETWEEN 10 AND 20

-- SUPER ADVANCE QUESTION
--Q1)
SELECT item_description, vendor_name, bottle_price
FROM ITEMS_TABLE
WHERE vendor_name = 
(SELECT vendor_name FROM ITEMS_TABLE WHERE item_id = 1);

--Q2)
CREATE PROCEDURE GetItemsAbovePrice (@Price DECIMAL(10,2))
AS
BEGIN SELECT * FROM ITEMS_TABLE WHERE bottle_price > @Price;
END;

--Q3)
CREATE PROCEDURE InsertProductSales
   @country VARCHAR(50),
   @product VARCHAR(50),
   @units_sold INT,
   @manufacturing_price DECIMAL(10,2),
   @sale_price DECIMAL(10,2),
   @date DATE,
   @month_name VARCHAR(20),
   @year INT
AS
BEGIN
   INSERT INTO PRODUCT_SALES_TABLE (Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Date, Month_Name, Year)
   VALUES (@country, @product, @units_sold, @manufacturing_price, @sale_price, @date, @month_name, @year);
END;

--Q4)
CREATE TRIGGER UpdateGrossSales
ON PRODUCT_SALES_TABLE
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE PST
    SET PST.Gross_Sales = I.Units_Sold * I.Sale_Price
    FROM PRODUCT_SALES_TABLE PST
    INNER JOIN inserted I
        ON PST.Product_Id = I.Product_Id;
END;

--Q5)
SELECT item_description
FROM ITEMS_TABLE
WHERE item_description LIKE '%Whisky%'
OR item_description LIKE '%whisky%';

--Q6)
SELECT Country, Product
FROM PRODUCT_SALES_TABLE
WHERE Profit > (
SELECT AVG(Profit) FROM PRODUCT_SALES_TABLE);

--Q7)
SELECT I.item_description, I.vendor_name, P.Country, P.Product, P.Sales, P.Profit
FROM ITEMS_TABLE I
JOIN PRODUCT_SALES_TABLE P
ON I.vendor_nos = P.vendor_nos;

--Q8)
SELECT item_description + ' - ' + vendor_name AS Combined_String
FROM ITEMS_TABLE;

--Q9)
SELECT item_description,
CAST(ROUND(bottle_price, 1) AS DECIMAL(10,1)) AS Rounded_Price
FROM ITEMS_TABLE;

--Q10)
SELECT Product, Country, Date,
DATEDIFF(DAY, Date, GETDATE()) AS Days_Difference
FROM PRODUCT_SALES_TABLE;
