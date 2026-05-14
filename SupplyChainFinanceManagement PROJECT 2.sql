--SQL_PROJECT_2

--TASK-1
CREATE DATABASE SupplyChainFinanceManagement;

USE SupplyChainFinanceManagement;

CREATE TABLE dim_customer (
customer_code INT,
customer VARCHAR(150),
platform VARCHAR(45),
channel VARCHAR(45),
market VARCHAR(45),
sub_zone VARCHAR(45),
region VARCHAR(45)
);

CREATE TABLE dim_product(
product_code VARCHAR(45),
division VARCHAR(45),
segment VARCHAR(45),
category VARCHAR(45),
product VARCHAR(200),
variant VARCHAR(45)
);

CREATE TABLE fact_forecast_monthly(
date DATE,
fiscal_year INT, 
product_code VARCHAR(20),
market VARCHAR(50),
forecast_qty INT,
PRIMARY KEY (date,product_code,market)
);

CREATE TABLE fact_freight_cost(
market VARCHAR(50),
fiscal_year INT,
freight_pct DECIMAL(5,2),
other_cost_pct DECIMAL(5,2),
PRIMARY KEY(market,fiscal_year)
);

CREATE TABLE fact_gross_price(
product_code VARCHAR(20),
fiscal_year INT,
gross_price DECIMAL(10,2),
PRIMARY KEY (product_code,fiscal_year)
);

CREATE TABLE fact_manufacturing_cost(
product_code VARCHAR(20),
fiscal_year INT,
manufacturing_cost DECIMAL(10,2),
PRIMARY KEY (product_code,fiscal_year)
);

CREATE TABLE fact_post_invoice_deduction(
customer_code INT,
product_code VARChAR(50),
date DATE,
Discounts_pct DECIMAL(10,2),
other_deduction_pct DECIMAL(10,2)
PRIMARY KEY (date,customer_code,product_code)
);

CREATE TABLE fact_pre_invoice_deductions(
customer_code INT,
fiscal_year INT,
pre_invoice_discount_pct DECIMAL(10,2)
);

CREATE TABLE fact_sales_monthly(
date DATE,
product_code VARCHAR(20),
customer_code INT,
sold_quantity INT
);

--TASK-2
--DIM_CUSTOMER DATA
INSERT INTO dim_customer
VALUES
(70020104,'Atliq e Store','E-Commerce','Direct','Austria','NE','EU'),
(70021096,'Atliq e Store','E-Commerce','Direct','United Kingdom','NE','EU'),
(70022084,'Atliq Exclusive','Brick & Mortar','Direct','USA','NA','NA'),
(70022085,'Atliq e Store','E-Commerce','Direct','USA','NA','NA'),
(70023031,'Atliq Exclusive','Brick & Mortar','Direct','Canada','NA','NA'),
(70023032,'Aliq e Store','E-commerce','Direct','Canada','NA','NA'),
(70026206,'Atliq e Store','E-commerce','Direct','Mexico','LATAM','LATAM'),
(70027208,'Atliq e Store','E-commerce','Direct','Brazil','LATAM','LATAM'),
(80001019,'Neptune','Brick & Mortar','Distributor','China','ROA','APAC'),
(80006154,'Synthetic','Brick & Mortar','Distributor','Philiphines','ROA','APAC'),
(80006155,'Novus','Brick & Mortar','Distributor','Philiphines','ROA','APAC');

SELECT * FROM dim_customer;

--DIM_PRODUCT DATA
INSERT INTO dim_product
VALUES
('A1919150403','P&A','Peripherals','Motherboard','AQ MB Lito','Plus 2'),
('A1920150404','P&A','Peripherals','Motherboard','AQ MB Lito','Premium'),
('A2020150501','P&A','Peripherals','Motherboard','AQ MB Lito 2','Standard'),
('A2020150502','P&A','Peripherals','Motherboard','AQ MB Lito 2','Plus 1'),
('A2021150503','P&A','Peripherals','Motherboard','AQ MB Lito 2','Plus 2'),
('A2021150504','P&A','Peripherals','Motherboard','AQ MB Lito 2','Premium'),
('A2118150101','P&A','Accessories','Mouse','AQ Master wired x1 Ms','Standard 1'),
('A2118150102','P&A','Accessories','Mouse','AQ Master wired x1 Ms','Standard 2'),
('A2118150103','P&A','Accessories','Mouse','AQ Master wired x1 Ms','Plus 1'),
('A2118150104','P&A','Accessories','Mouse','AQ Master wired x1 Ms','Plus 2'),
('A2118150105','P&A','Accessories','Mouse','AQ Master wired x1 Ms','Premium 1');

SELECT * FROM dim_product;

--fact_forecast_monthly DATA
INSERT INTO fact_forecast_monthly
VALUES 
('2017-09-01','2018','A0118150101',70002017,18),
('2017-09-01','2018','A0118150101',70002018,11),
('2017-09-01','2018','A0118150101',70003181,9),
('2017-09-01','2018','A0118150101',70003182,6),
('2017-09-01','2018','A0118150101',70006157,5),
('2017-09-01','2018','A0118150101',70006158,6),
('2017-09-01','2018','A0118150101',70007198,4),
('2017-09-01','2018','A0118150101',70007199,7),
('2017-09-01','2018','A0118150101',70008169,7),
('2017-09-01','2018','A0118150101',70008170,8),
('2017-09-01','2018','A0118150101',70011193,5);

SELECT * FROM fact_forecast_monthly;

--fact_freight_cost DATA
INSERT INTO fact_freight_cost
VALUES
('Germany',2020,0.0226,0.0060),
('Germany',2021,0.0226,0.0060),
('Germany',2022,0.0226,0.0060),
('India',2018,0.0244,0.0026),
('India',2019,0.0219,0.0057),
('India',2020,0.0309,0.0029),
('India',2021,0.0309,0.0029),
('India',2022,0.0309,0.0029),
('Indonesia',2018,0.0190,0.0042),
('Indonesia',2019,0.0187,0.0052),
('Indonesia',2020,0.0195,0.0023);

SELECT * FROM fact_freight_cost;

--fact_gross_price DATA
INSERT INTO fact_gross_price
VALUES 
('A0118150101',2018,15.3952),
('A0118150101',2019,14.4392),
('A0118150101',2020,16.2323),
('A0118150101',2021,19.0573),
('A0118150102',2018,19.5875),
('A0118150102',2019,18.5595),
('A0118150102',2020,19.8577),
('A0118150102',2021,21.4565),
('A0118150103',2018,19.3630),
('A0118150103',2019,19.3442),
('A0118150103',2020,22.1317);

SELECT * FROM fact_gross_price;

--fact_manufacturing_cost DATA
INSERT INTO fact_manufacturing_cost
VALUES
('A0118150101',2018,4.6190),
('A0118150101',2019,4.2033),
('A0118150101',2020,5.0207),
('A0118150101',2021,5.5172),
('A0118150102',2018,5.6036),
('A0118150102',2019,5.3235),
('A0118150102',2020,5.7180),
('A0118150102',2021,6.2835),
('A0118150103',2018,5.9469),
('A0118150103',2019,5.5306),
('A0118150103',2020,6.3264);

SELECT * FROM fact_manufacturing_cost;

--fact_post_invoice_deductions DATA
INSERT INTO fact_post_invoice_deduction
VALUES
(70002017,'A0118150101','2017-09-01',0.2660,0.0719),
(70002017,'A0118150101','2017-10-11',0.3090,0.0976),
(70002017,'A0118150101','2017-11-01',0.3313,0.0752),
(70002017,'A0118150101','2018-01-01',0.2958,0.0720),
(70002017,'A0118150101','2018-02-01',03208.,0.0793),
(70002017,'A0118150101','2018-03-01',0.2635,0.1007),
(70002017,'A0118150101','2018-05-01',0.2231,0.0820),
(70002017,'A0118150101','2018-06-01',0.3020,0.0791),
(70002017,'A0118150101','2018-07-01',0.3123,0.0929),
(70002017,'A0118150101','2018-09-01',0.1530,0.1288),
(70002017,'A0118150101','2018-10-01',0.1363,0.1542);

SELECT * FROM fact_post_invoice_deduction;

--Fact_pre_invoice_deductions DATA 
INSERT INTO fact_pre_invoice_deductions
VALUES
(70002017,2018,0.0824),
(70002017,2019,0.0777),
(70002017,2020,0.0735),
(70002017,2021,0.0703),
(70002017,2022,0.1057),
(70002017,2018,0.2956),
(70002017,2019,0.2577),
(70002017,2020,0.2255),
(70002017,2021,0.2061),
(70002017,2022,0.2931),
(70002017,2018,0.0536);

SELECT * FROM fact_pre_invoice_deductions;

--fact_sales_monthly DATA
INSERT INTO fact_sales_monthly
VALUES
('2017-09-01','A0118150101',70002017,51),
('2017-09-01','A0118150101',70002018,77),
('2017-09-01','A0118150101',70003181,17),
('2017-09-01','A0118150101',70003182,6),
('2017-09-01','A0118150101',70006157,5),
('2017-09-01','A0118150101',70006158,7),
('2017-09-01','A0118150101',70007198,29),
('2017-09-01','A0118150101',70007199,34),
('2017-09-01','A0118150101',70008169,22),
('2017-09-01','A0118150101',70008170,5),
('2017-09-01','A0118150101',70011193,10);

SELECT * FROM fact_sales_monthly;

--TASK-3
--Q1)
SELECT
CASE
WHEN DATEPART(MONTH, CAST('2023-07-15' AS DATE)) >= 9
THEN DATEPART(YEAR,  CAST('2023-07-15' AS DATE)) + 1
ELSE DATEPART(YEAR,  CAST('2023-07-15' AS DATE))
END AS Fiscal_Year;

--Q2)
SELECT 
    s.date,
    p.product_code,
    p.variant,
    s.sold_quantity,
    g.gross_price,
    (s.sold_quantity * g.gross_price) AS gross_price_total
FROM fact_sales_monthly s
JOIN dim_product p 
    ON s.product_code = p.product_code
JOIN fact_gross_price g
    ON s.product_code = g.product_code
   AND g.fiscal_year =
        CASE 
            WHEN MONTH(s.date) >= 9 
            THEN YEAR(s.date) + 1
            ELSE YEAR(s.date)
        END
WHERE s.customer_code = 1001
  AND (
        CASE 
            WHEN MONTH(s.date) >= 9 
THEN YEAR(s.date) + 1
ELSE YEAR(s.date)
END) = 2023;

--TASK 4
--SALES TREND ANALYSIS
SELECT 
product_code,
MONTH(date) AS Month,
SUM(sold_quantity) AS Monthly_Sales
FROM fact_sales_monthly
GROUP BY product_code, MONTH(date)
ORDER BY product_code, Month;

--CUSTOMER SEGNENTATION
SELECT 
	customer_code,
	sum(sold_quantity) AS Total_Purchases
FROM fact_sales_monthly
GROUP BY customer_code
ORDER BY Total_Purchases DESC;

--PRODUCT PERFORMANCE COMPARISON
SELECT 
product_code,
SUM(sold_quantity) AS Total_Qty_Sold
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY Total_Qty_Sold DESC;

--MARKET EXPANSION OPPPORTUNITIES
SELECT 
market,
SUM(forecast_qty) AS Forecasted_Demand
FROM fact_forecast_monthly
GROUP BY market
ORDER BY Forecasted_Demand DESC;

--COST & PROFITABILITY ANALYSIS
SELECT 
g.product_code,
g.gross_price,
m.manufacturing_cost,
(g.gross_price-m.manufacturing_cost) AS Profit
FROM fact_gross_price g
JOIN fact_manufacturing_cost m
ON g.product_code= m.product_code
AND g.fiscal_year = m.fiscal_year;

--DISCOUNT IMPACT ANALYSIS
SELECT customer_code,
AVG(pre_invoice_discount_pct) AS AVG_Discount
FROM fact_pre_invoice_deductions
GROUP BY customer_code;

--MARKET-WISE FREIGHT COST ANALYSIS
SELECT market,
AVG(freight_pct + other_cost_pct) AS Avg_Freight_cost
FROM fact_freight_cost
GROUP BY market;

--SEASONAL SALES PATTERNS
SELECT 
MONTH(date) AS Month,
SUM(sold_quantity) AS Sales
FROM fact_sales_monthly
GROUP BY MONTH(date)
ORDER BY Month;

--CUSTOMER LOYALTY ANALYSIS
SELECT 
customer_code,
COUNT(DISTINCT date) AS Purchase_Frequency
FROM fact_sales_monthly
GROUP BY customer_code
ORDER BY Purchase_Frequency DESC;

--FORECAST ACCURACY EVALUATION
SELECT 
f.product_code,
SUM(f.forecast_qty) AS Forecasted,
SUM(s.sold_quantity) AS Actual,
(SUM(s.sold_quantity)*100.0 / NULLIF(SUM(f.forecast_qty),0)) AS Accuracy_Pct
FROM fact_forecast_monthly f
JOIN fact_sales_monthly s
ON f.product_code = s.product_code
AND f.date = s.date
GROUP BY f.product_code;

--CHANNEL PERFORMANCE ASSESSMENT
SELECT 
c.channel,
SUM(s.sold_quantity) AS Units_Sold
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
GROUP BY c.channel
ORDER BY Units_Sold DESC;

--GEOGRAPHICAL SALES DISTRIBUTION
SELECT 
c.market,
SUM(s.sold_quantity) AS Total_Sales
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
GROUP BY c.market
ORDER BY Total_Sales DESC;

--CUSTOMER ACQUISTION COST ANALYSIS
SELECT 
market,
AVG(freight_pct + other_cost_pct) AS Acquisition_Cost
FROM fact_freight_cost
GROUP BY market;

--PRODUCT MIX OPTIMIZATION
SELECT 
product_code,
SUM(sold_quantity) AS Sales_Volume
FROM fact_sales_monthly
GROUP BY product_code
ORDER BY Sales_Volume DESC;

--CUSTOMER LIFETIME VALUE CALCULATION
SELECT 
    s.customer_code,
    SUM(
        s.sold_quantity * g.gross_price
    ) AS Customer_Lifetime_Value
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code
AND g.fiscal_year =
    CASE 
        WHEN MONTH(s.date) >= 9 THEN YEAR(s.date) + 1
        ELSE YEAR(s.date)
    END
GROUP BY s.customer_code
ORDER BY Customer_Lifetime_Value DESC;

--INVENTORY MANAGEMENT ANALYSIS
SELECT 
product_code,
SUM(sold_quantity) AS Total_Sold
FROM fact_sales_monthly
GROUP BY product_code;


--PRICE ELASTICITY ESTIMATION 
SELECT 
s.product_code,
AVG(gross_price) AS Avg_Price,
SUM(sold_quantity) AS Quantity_Sold
FROM fact_sales_monthly s
JOIN fact_gross_price g
ON s.product_code = g.product_code
AND g.fiscal_year = g.fiscal_year
GROUP BY s.product_code;

--MARKETING CAMPAIGN EFFECTIVENESS
SELECT 
MONTH(date) AS Month,
SUM(sold_quantity) AS Campaign_Sales
FROM fact_sales_monthly
GROUP BY MONTH(date);

--TASK 5
--1)
DROP FUNCTION IF EXISTS fn_total_forecast;
GO

CREATE FUNCTION fn_total_forecast 
(
@product VARCHAR(20), 
@year INT
)
RETURNS INT
AS BEGIN 
RETURN (SELECT SUM(forecast_qty)
FROM fact_forecast_monthly
WHERE product_code =@product
AND fiscal_year = @year
);
END;

--2)
SELECT customer_code
FROM fact_sales_monthly
GROUP BY customer_code
HAVING SUM(sold_quantity) >
(SELECT AVG(sold_quantity) FROM fact_sales_monthly);

--3)
CREATE PROCEDURE sp_update_gross_price 
@product VARCHAR(20),
@year INT,
@price DECIMAL(10,2)
AS UPDATE fact_gross_price
SET gross_price = @price
WHERE product_code = @product
AND fiscal_year = @year;

--4)
CREATE TABLE sale_audit(
audit_id INT IDENTITY,
audit_date DATETIME DEFAULT GETDATE()
);
GO

CREATE TRIGGER trg_sales_insert
ON fact_sales_monthly 
AFTER INSERT 
AS INSERT INTO sales_audit DEFAULT VALUES;

--5)
SELECT 
    product_code,
    CASE 
        WHEN MONTH(date) >= 9 THEN YEAR(date) + 1
        ELSE YEAR(date)
    END AS fiscal_year,
    RANK() OVER (
        PARTITION BY 
        CASE 
            WHEN MONTH(date) >= 9 THEN YEAR(date) + 1
            ELSE YEAR(date)
        END
        ORDER BY SUM(sold_quantity) DESC
    ) AS Rank
FROM fact_sales_monthly
GROUP BY 
    product_code,
    CASE 
        WHEN MONTH(date) >= 9 THEN YEAR(date) + 1
        ELSE YEAR(date)
    END;

--6)
SELECT 
STRING_AGG(c.customer,',') AS Customers
FROM dim_customer c
JOIN fact_sales_monthly s
ON c.customer_code = s.customer_code
WHERE s.product_code = 'P100';

--9)
SELECT date,
sold_quantity,
LAG(sold_quantity) OVER (ORDER BY date) AS 
Previous_Month_Sales
FROM fact_sales_monthly;

--10)
SELECT * FROM (
SELECT 
c.market,
s.product_code,
SUM(sold_quantity) AS Total_Sales,
RANK() OVER (PARTITION BY c.market ORDER BY 
SUM(s.sold_quantity)DESC) AS rnk FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
GROUP BY c.market,s.product_code) t WHERE rnk = 1;

--11)
CREATE PROCEDURE sp_update_total_cost
@market VARCHAR(50),
@fiscal_year INT
AS
SELECT dbo.fn_total_forecast_cost(@market,@fiscal_year) AS Total_frieght_cost;

--12)
CREATE TRIGGER trg_update_inventory
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    UPDATE inv
    SET inv.inventory_qty = inv.inventory_qty - i.sold_quantity
    FROM fact_inventory inv
    JOIN inserted i
    ON inv.product_code = i.product_code;
END;

--13)
CREATE TRIGGER trg_validate_product
ON fact_sales_monthly
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE NOT EXISTS (
            SELECT 1 FROM dim_product p
            WHERE p.product_code = i.product_code
        )
    )
    BEGIN
        RAISERROR('Invalid Product Code', 16, 1);
        RETURN;
    END;

    INSERT INTO fact_sales_monthly
    SELECT * FROM inserted;
END;

--14)
CREATE PROCEDURE sp_monthly_growth
AS
SELECT 
    product_code,
    date,
    sold_quantity,
    LAG(sold_quantity) OVER (PARTITION BY product_code ORDER BY date) AS Prev_Month,
    ((sold_quantity - LAG(sold_quantity) OVER 
      (PARTITION BY product_code ORDER BY date)) * 100.0 /
      NULLIF(LAG(sold_quantity) OVER 
      (PARTITION BY product_code ORDER BY date),0)) AS Growth_Pct
FROM fact_sales_monthly;

--15)
CREATE FUNCTION fn_avg_discount_pct
(@product_code VARCHAR(20))
RETURNS DECIMAL(10,2)
AS
BEGIN
    RETURN (
        SELECT AVG(discounts_pct)
        FROM fact_post_invoice_deductions
        WHERE product_code = @product_code
    );
END;

--16)
SELECT *
FROM (
    SELECT 
        c.market,
        s.customer_code,
        SUM(s.sold_quantity) AS Total_Purchase,
        RANK() OVER (PARTITION BY c.market ORDER BY SUM(s.sold_quantity) DESC) rnk
    FROM fact_sales_monthly s
    JOIN dim_customer c
    ON s.customer_code = c.customer_code
    GROUP BY c.market, s.customer_code
) t
WHERE rnk = 1;

--17)
CREATE PROCEDURE sp_total_revenue
@start_date DATE,
@end_date DATE
AS
BEGIN
    SELECT 
        SUM(s.sold_quantity * g.gross_price) AS Total_Revenue
    FROM fact_sales_monthly s
    JOIN fact_gross_price g
      ON s.product_code = g.product_code
     AND g.fiscal_year =
        CASE 
            WHEN MONTH(s.date) >= 9 
            THEN YEAR(s.date) + 1
            ELSE YEAR(s.date)
        END
    WHERE s.date BETWEEN @start_date AND @end_date;
END;

--18)
CREATE TRIGGER trg_add_forecast
ON dim_product
AFTER INSERT
AS
BEGIN
    INSERT INTO fact_forecast_monthly (date, fiscal_year, product_code, market, forecast_qty)
    SELECT 
        GETDATE(),
        YEAR(GETDATE()),
        product_code,
        'India',
        1000
    FROM inserted;
END;

--19)
CREATE TRIGGER trg_sales_outlier
ON fact_sales_monthly
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        WHERE i.sold_quantity >
        (SELECT AVG(sold_quantity) + 2 * STDEV(sold_quantity)
         FROM fact_sales_monthly)
    )
    BEGIN
        PRINT 'Outlier detected – investigate sales spike';
    END;
END;

--20)
SELECT product_code, AVG(gross_price) AS Avg_Gross_Price
FROM fact_gross_price
GROUP BY product_code
HAVING AVG(gross_price) = (
    SELECT MAX(avg_price)
    FROM (
        SELECT AVG(gross_price) avg_price
        FROM fact_gross_price
        GROUP BY product_code
    ) t
);

--TASK 6
SELECT 
    fiscal_year,
    [1]  AS Jan_Actual,
    [2]  AS Feb_Actual,
    [3]  AS Mar_Actual,
    [4]  AS Apr_Actual,
    [5]  AS May_Actual,
    [6]  AS Jun_Actual,
    [7]  AS Jul_Actual,
    [8]  AS Aug_Actual,
    [9]  AS Sep_Actual,
    [10] AS Oct_Actual,
    [11] AS Nov_Actual,
    [12] AS Dec_Actual
FROM (
    SELECT 
        f.fiscal_year,
        MONTH(f.date) AS Month,
        s.sold_quantity
    FROM fact_forecast_monthly f
    JOIN fact_sales_monthly s
      ON f.product_code = s.product_code
     AND f.date = s.date
) src
PIVOT (
    SUM(sold_quantity)
    FOR Month IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
) p;














