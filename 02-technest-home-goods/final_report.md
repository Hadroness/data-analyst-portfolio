# Final Report — TechNest Home Goods Sales Analysis

## Key Findings

**1. Price point drives revenue more than unit volume.**
`Floor Lamp` generated the highest revenue ($15,691) despite selling fewer units (176) than
`Cotton Bedsheet Set` (182 units). Its higher price point ($89 vs. lower-cost items) made it
the top revenue driver even without the highest sales volume — a useful reminder when deciding
which products to prioritize in marketing or restocking.

**2. The real top customer has been identified with confidence.**
Because several customers in this dataset share first or full names, the analysis grouped
by unique customer ID rather than name alone. The top customer (Karen Clark, customer ID 57)
leads with $1,953 in total spend — a strong candidate for a loyalty or VIP program.

**3. Lighting products show a higher return rate than other categories.**
`Table Lamp` had the highest number of returns (9 orders, 13 units) of any product, and
`Floor Lamp` — despite being the top revenue product — also ranked second in returns (6 orders).
Together, lighting products account for a disproportionate share of all returns, which may be
worth investigating (packaging/shipping damage, product description accuracy, or quality control).

## Known Data Limitations

- Some order dates were in an ambiguous M/D vs. D/M format; where genuinely unclear, the more
  common format in the dataset was assumed. This may have shifted a small number of orders
  between adjacent months.
- Missing `quantity` values were filled with 1, the most common order size — this may slightly
  understate true revenue.
- Missing or zero `unit_price` values were replaced with the average price of that specific
  product (excluding zero/missing entries) to avoid distorting revenue totals.
- Orders with an invalid customer ID (9999, not present in the customer table) were excluded
  from customer-level analysis.

## Deliverables
- `orders_raw_clean.xlsx` / `customers_raw_clean.xlsx` — final cleaned datasets
- `sql_analysis.sql` — all SQL queries with comments
- Excel dashboard — monthly revenue trend, revenue by category, top 10 customers, return-rate KPI
