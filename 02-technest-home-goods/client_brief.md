# Project 2: Sales Analysis for "TechNest Home Goods"

## Background (simulated client request)

> Hi, I run a small online home goods store — we sell things like lamps, bedding, wall
> decor, and kitchen items. Our order export from the store platform is a mess: dates are
> all over the place, some prices are missing or zero, product names have inconsistent
> capitalization, and I think there are some duplicate orders too. I need to know:
> 1. What was our monthly revenue?
> 2. Which products and categories are selling best (by revenue, not just units)?
> 3. Who are my top 10 customers by total spend?
> 4. How many returns are we getting, and on which products?
>
> Files are attached. Please clean everything up and give me a report and a dashboard I
> can actually use.

## Data files (attached)

- `orders_raw.csv` — 1,312 order rows (messy)
- `customers_raw.csv` — 114 customer rows (messy)

## Known data issues

- Mixed date formats in `order_date` (four different formats)
- Inconsistent casing/whitespace in `product_name` and `category`
- Missing values in `quantity`, `unit_price`, `payment_method`
- Some `unit_price` values are zero (data entry error)
- Negative `quantity` values — these represent returns, not errors; keep and analyze separately
- Fully duplicated rows in both tables
- Some `customer_id` values in orders (9999) that don't exist in the customers table
- Inconsistent city spelling/casing in the customers table
- Inconsistent casing/whitespace in `payment_method`

## Expected deliverables

### 1. Data cleaning (Excel)
- Standardize dates, text casing, and whitespace
- Handle missing values with a documented, reasoned approach
- Remove true duplicates
- Flag invalid `customer_id` records
- Separate returns from valid sales

### 2. SQL analysis
- Monthly revenue and order count
- Top 5 products by revenue
- Top 10 customers by total spend (window function)
- Repeat customers (CTE)
- Return totals by product

### 3. Excel dashboard
- Pivot table: revenue by month and category
- Monthly revenue trend chart
- Top 10 customers table
- KPI: return rate (% of orders that were returns)

## What "good delivery" looks like
- Cleaned dataset + documented cleaning decisions
- Commented SQL file
- Excel dashboard
- One-paragraph summary of the biggest business finding
