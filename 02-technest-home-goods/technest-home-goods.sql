CREATE DATABASE technest_home_goods;
USE technest_home_goods;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(50),
    signup_date DATE
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10,2),
    payment_method VARCHAR(20),
    order_type VARCHAR(10),
    total_price DECIMAL(10,2)
);
SELECT * 
FROM orders_raw;
SELECT * 
FROM customers_raw;
DESCRIBE orders_raw;
DESCRIBE customers_raw;
ALTER TABLE orders_raw CHANGE `ï»¿order_id` order_id INT;
ALTER TABLE customers_raw CHANGE `ï»¿Customer_id` order_id INT;
UPDATE orders_raw
SET unit_price = REGEXP_REPLACE(unit_price, '[^0-9.]', '');
ALTER TABLE orders_raw MODIFY unit_price DECIMAL(10,2);
UPDATE orders_raw
SET Total_price = REGEXP_REPLACE(Total_price, '[^0-9.]', '');
ALTER TABLE orders_raw MODIFY Total_Price DECIMAL(10,2);
DESCRIBE orders_raw;
UPDATE orders_raw
SET order_date = STR_TO_DATE(order_date, '%c/%e/%Y');
ALTER TABLE orders_raw MODIFY order_date DATE;
UPDATE orders_raw
SET Total_Price = quantity * unit_price;
----------------------------------------------------------------------------------------------
-- Monthly Revenue & Order Count --
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(Total_Price) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders_raw
GROUP BY sales_month
ORDER BY sales_month;

-- Top 5 Products by Revenue --
SELECT
    Product_Name,
    SUM(Total_Price) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM orders_raw
WHERE Order_Type = 'sale'
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 5;

-- Top 10 Customers by Total Spend --
SELECT
    customer_id,
    Customer_Name,
    SUM(Total_Price) AS total_spent,
    RANK() OVER (ORDER BY SUM(Total_Price) DESC) AS customer_rank
FROM orders_raw
WHERE Order_Type = 'Sale'
GROUP BY customer_id, Customer_Name
ORDER BY customer_rank
LIMIT 10;

-- Repeat Customers --
WITH customer_order_count AS (
    SELECT
        customer_id,
        Customer_Name,
        COUNT(order_id) AS number_of_orders
    FROM orders_raw
    WHERE Order_Type = 'Sale'
    GROUP BY customer_id, Customer_Name
)
SELECT *
FROM customer_order_count
WHERE number_of_orders > 1
ORDER BY number_of_orders DESC;

-- Returns by Product --
SELECT
    Product_Name,
    COUNT(order_id) AS number_of_returns,
    SUM(Total_Price) AS total_return_value,
    SUM(quantity) AS total_units_returned
FROM orders_raw
WHERE Order_Type = 'Return'
GROUP BY Product_Name
ORDER BY number_of_returns DESC;