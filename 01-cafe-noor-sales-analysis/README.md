# Cafe Noor Sales Analysis

Data cleaning and sales analysis for a small coffee shop chain, based on messy POS export data (Excel + SQL).

## Business Problem

The client operates a small coffee chain and needed answers to four questions from their raw sales data:

1. What was actual monthly revenue?
2. What are the best-selling products and categories?
3. Which customers spend the most (for a loyalty program)?
4. How many returns occurred, and on which products?

The raw export had significant data quality issues: mixed date formats, inconsistent text casing, missing values, invalid price entries, and duplicate/orphaned records.

## Approach

1. **Data cleaning (Excel)** — standardized date formats, normalized text fields (product names, categories, payment methods, city names), resolved missing and zero-value entries using product-level averages where appropriate, and separated returns from valid sales rather than deleting them.
2. **SQL analysis (MySQL)** — loaded the cleaned data into a relational schema and wrote queries covering monthly revenue trends, top products by revenue, customer ranking (window functions), repeat customers (CTE), and return analysis by product.
3. **Dashboard (Excel)** — built pivot tables and a monthly trend chart, a top-10 customer table, and a return-rate KPI.

## Key Findings

- **Revenue and unit sales don't always align.** The top-revenue product had fewer units sold than the top-volume product, purely due to its higher price point — a reminder that "best-seller" and "most profitable" aren't always the same item.
- **Customer identification required care.** Several customers shared the same name; ranking by name alone would have merged distinct customers together. Analysis was corrected to group by customer ID.
- **One product stood out for returns.** A single item accounted for a disproportionate share of all returns, while the top-selling item had zero returns — a useful signal for a quality check.

## Files

| File | Description |
|---|---|
| `client_brief.md` | Original project brief and requirements |
| `orders_raw.csv` / `customers_raw.csv` | Raw, uncleaned source data |
| `Cafe_Noor_Final.sql` | All SQL queries with comments |
| `Cafe_Noor_Final.xlsx` | Cleaned datasets , Excel dashboard (pivot tables, chart, KPI) |
| `final_report.md` | Summary of findings and data limitations |

## Tools Used
Excel (formulas, Pivot Tables, PivotCharts), MySQL (joins, CTEs, window functions)
