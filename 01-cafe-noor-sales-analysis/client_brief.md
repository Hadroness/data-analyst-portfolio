# Project 1: Sales Analysis for "Cafe Noor"

## Background (simulated client request)

> Hi, I own a small coffee shop chain with 3 locations. Our POS system exports order and
> customer data, but it's pretty messy — dates are in different formats, some prices show
> as zero, product names are inconsistently capitalized, and I think a few orders got
> duplicated. I'd like to know:
> 1. What was our actual monthly revenue?
> 2. What are our best-selling products and categories?
> 3. Which customers spend the most (I want to set up a loyalty discount)?
> 4. How many returns did we have (negative quantity), and on which products?
>
> I'm attaching the raw files — please clean the data and give me a report/dashboard so I
> can actually understand what's going on.

## Data files (attached)

- `orders_raw.csv` — 1,415 order rows (messy)
- `customers_raw.csv` — 125 customer rows (messy)

## Known data issues (things to find and fix)

- Multiple date formats mixed together in `order_date` (four different formats)
- Inconsistent casing and extra whitespace in product name and category (`ESPRESSO`, ` Espresso`, `espresso`)
- Missing values (`NaN`) in `quantity`, `unit_price`, and `payment_method`
- Some `unit_price` values are zero (data entry error, not a real price)
- Negative `quantity` values (these are NOT errors — they represent returns, and should be analyzed separately, not deleted)
- Fully duplicated rows in both tables
- Several `customer_id` values in the orders table that don't exist in the customers table (value 9999)
- Inconsistent city name spelling in the customers table (`Tehran`, `tehran`, `TEHRAN`, `Tehrn`)
- Inconsistent casing/whitespace in payment method (`Card`, `card`, `CASH`, `Online `)

## Expected deliverables

### 1. Data cleaning (Excel and/or SQL)
- Standardize date format
- Standardize casing and whitespace in text fields (product_name, category, city, payment_method)
- Make a reasoned decision on missing values (drop? impute? explain why)
- Remove true duplicate rows
- Flag or separate orders with invalid `customer_id` (9999)
- Separate returns (negative quantity) from actual sales for independent analysis

### 2. SQL analysis (after loading clean data into a database)
Write queries for:
- Total revenue and order count by month
- Top 5 products by revenue (not just order count)
- Customer ranking by total spend using a **Window Function** (`RANK()` or `DENSE_RANK()`)
- Repeat customers (more than one order) using a subquery or CTE
- Return totals and counts by product

### 3. Excel dashboard
- Pivot Table: revenue by month and category
- Monthly sales trend chart
- Top 10 customers table
- A simple KPI: percentage of orders that were returns

## What "good delivery" looks like
- Cleaned file (CSV/Excel) + a short explanation of the decisions made
- SQL file with queries and comments for each
- Excel dashboard file
- A one-paragraph summary: "What was the biggest finding?" (this is exactly what a real analyst should be able to tell a client)
