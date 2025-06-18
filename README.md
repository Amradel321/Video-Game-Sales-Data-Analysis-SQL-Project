# Video-Game-Sales-Data-Analysis-SQL-Project
This project involves cleaning, transforming, and analyzing a video game sales dataset using SQL. The goal is to uncover business insights about platform trends, genre performance, regional sales distribution, and publisher dominance.

---

##  Dataset Overview

- Data contains sales information for video games across North America, Japan, and PAL regions.
- Fields include: `title`, `genre`, `console`, `publisher`, `developer`, `release_date`, `critic_score`, `total_sales`, and more.

---

##  Data Cleaning & Transformation

- Removed duplicates using `ROW_NUMBER()` and CTEs.
- Cleaned inconsistent publisher names (e.g., “Namco Bandai” → “Bandai Namco”).
- Converted columns to appropriate types (e.g., `critic_score` to `DECIMAL`, dates to `DATE`).
- Handled NULLs in `critic_score` and `release_date`.

---

##  Key Analyses Performed

-  Top 10 Best-Selling Games
-  Highest-Grossing Publishers
-  Sales by Genre and Console
-  Regional Sales Comparison (NA, JP, PAL)
-  Most Consistent Hit-Makers (multi-hit publishers)
-  Year-by-Year Sales Trend per Genre
-  Average Sales per Game by Genre
-  Platform Market Share by Region

---

##  Insights

- Shooter and Action genres dominate global sales.
- PlayStation and Nintendo consoles have the highest lifetime sales.
- North America consistently outperforms Japan and PAL regions in sales.
- Bandai Namco and Electronic Arts are top publishers with multiple hit games.
- Shooter genre has the highest average sales per game.

---

##  Tools & Skills Used

- **SQL**: CTEs, `RANK()`, `ROW_NUMBER()`, `GROUP BY`, `JOIN`, subqueries
- Data Cleaning & Formatting
- Relational Database Knowledge (MySQL/PostgreSQL compatible)

---

##  Sample Query

```sql
-- Top 10 Best-Selling Games
WITH ranked_games AS (
  SELECT title, SUM(total_sales) AS total_sales
  FROM sales_staging
  GROUP BY title
)
SELECT title, total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS rank
FROM ranked_games
LIMIT 10;

```
---

 Contact
 amradelark@gmail.com

 LinkedIn: www.linkedin.com/in/amr-adel-333107278




