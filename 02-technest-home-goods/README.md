# TechNest Home Goods Sales Analysis

Data cleaning and sales analysis for a small U.S.-based online home goods store, based on messy order export data (Excel + SQL).

## Business Problem

The client runs a small online store selling lighting, bedding, kitchen, and home decor items, and needed answers to four questions from their raw order data:

1. What was monthly revenue?
2. Which products and categories are top performers by revenue?
3. Who are the top 10 customers by total spend?
4. How many returns are occurring, and on which products?

The raw export had significant data quality issues: mixed date formats, inconsistent text casing, missing and zero-value price entries, and duplicate/invalid records.

## Approach

1. **Data cleaning (Excel)** — standardized date formats, normalized text fields (product names, categories, payment methods, city names), resolved missing and zero-value entries using product-level price averages, and separated returns from valid sales.
2. **SQL analysis (MySQL)** — loaded the cleaned data into a relational schema and wrote queries covering monthly revenue, top products by revenue, customer ranking (window functions), repeat customers (CTE), and return analysis by product.
3. **Dashboard (Excel)** — pivot tables, a monthly revenue trend chart, a top-10 customer table, and a return-rate KPI.

## Key Findings

- **Price point can matter more than volume.** The top-revenue product wasn't the top-selling one by units — its higher price made the difference.
- **Customer identification required care.** Several customers shared the same name; analysis was grouped by customer ID to avoid merging distinct people.
- **Lighting products had a higher return rate** than other categories — a signal worth investigating further (packaging, shipping, or product accuracy).

## Files

| File | Description |
|---|---|
| `client_brief.md` | Original project brief and requirements |
| `orders_raw.csv` / `customers_raw.csv` | Raw, uncleaned source data |
| `orders_raw_clean.xlsx` / `customers_raw_clean.xlsx` | Cleaned datasets | | Excel dashboard (pivot tables, chart, KPI) |
| `sql_analysis.sql` | All SQL queries with comments |
| `final_report.md` | Summary of findings and data limitations |

## Tools Used
Excel (formulas, Pivot Tables, PivotCharts, XLOOKUP), MySQL (joins, CTEs, window functions)
