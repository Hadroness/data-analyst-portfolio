# Final Report — Cafe Noor Sales Analysis

## Key Findings (top takeaways for the client)

After fully cleaning the order and customer data (fixing mixed date formats, standardizing
text fields, resolving missing/zero values, and removing invalid records), the following
analysis was performed on the clean dataset:

**1. Units sold and revenue don't always tell the same story.**
`Cheesecake` sold fewer units than `Cappuccino` (213 vs. 261), but because of its higher
unit price, it generated the **highest revenue** of any product. This shows that decisions
based purely on "best-seller by volume" can be misleading — revenue needs to be considered too.

**2. The real top customers have been identified.**
After fixing an important analysis bug (several distinct customers shared the same name),
an accurate top-10 customer list was produced using unique customer IDs rather than names
alone. The top customer (Elham Karimi, customer ID 78) is clearly ahead of the rest with
28 orders and roughly 364 million in total spend — the strongest candidate for a loyalty discount.

**3. One product needs a quality review.**
`Latte` had the highest number of returns (9 orders, 14 units) of any product — noticeably
more than any other item. It may be worth checking the preparation process or ingredients
for this item. By contrast, `Cappuccino`, despite being a best-seller, had **zero returns** —
a sign of consistent quality.

## Known Data Limitations (being transparent with the client)

- A portion of order dates (DD/MM vs. MM/DD format) were genuinely ambiguous. For these
  cases, the dominant format in the dataset was assumed to be correct. This may have shifted
  a small number of orders between two adjacent months.
- Missing `quantity` values were filled in with 1 (the most common value in the dataset);
  this may slightly understate true revenue.
- Missing payment method ("Unknown") and missing email ("No Email Provided") were explicitly
  flagged rather than guessed, so as not to distort the reported statistics.

## Deliverables
- `orders_clean` / `customers_clean` — final cleaned datasets
- `sql_analysis_en.sql` — all SQL queries with comments
- Excel dashboard — monthly sales trend, revenue by category, top 10 customers, and return-rate KPI
