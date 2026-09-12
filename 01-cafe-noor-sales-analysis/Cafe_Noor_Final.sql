select*
from customers_raw;
select*
from orders_raw;
USE cafe_noor;
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    SUM(total_price) AS total_revenue,
    COUNT(order_id) AS total_orders
FROM orders_raw
GROUP BY sales_month
ORDER BY sales_month;
SELECT order_date FROM orders_raw LIMIT 10;
UPDATE orders_raw
SET order_date = STR_TO_DATE(order_date, '%c/%e/%Y');
SELECT
    product_name,
    SUM(total_price) AS total_revenue,
    SUM(quantity) AS total_units_sold
FROM orders_raw
WHERE order_type = 'Bought'
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;
WITH customer_order_count AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(order_id) AS number_of_orders
    FROM orders_raw
    WHERE order_type = 'Bought'
    GROUP BY customer_id, customer_name
)
SELECT *
FROM customer_order_count
WHERE number_of_orders > 1
ORDER BY number_of_orders DESC;
SELECT
    customer_id,
    customer_name,
    SUM(total_price) AS total_spent,
    RANK() OVER (ORDER BY SUM(total_price) DESC) AS customer_rank
FROM orders_raw
WHERE order_type = 'Bought'
GROUP BY customer_id, customer_name
ORDER BY customer_rank
LIMIT 10;
SELECT
    product_name,
    COUNT(order_id) AS number_of_returns,
    SUM(total_price) AS total_return_value,
    SUM(quantity) AS total_units_returned
FROM orders_raw
WHERE order_type = 'Return'
GROUP BY product_name
ORDER BY number_of_returns DESC;