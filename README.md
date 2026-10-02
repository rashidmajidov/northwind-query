# Northwind Query

This repository is a collection of SQL queries written on the classic **Northwind** sample database (PostgreSQL) for learning and practice purposes. It demonstrates various SQL techniques step by step, from simple selects to window functions.

## Database

The queries run on the Northwind PostgreSQL schema and primarily use the following tables:

- `customers`, `orders`, `"Order Details"`
- `products`, `categories`, `suppliers`
- `employees`

## File Structure

```
northwind-query/
│
├── notebooks/
│   ├── 5_simple_queries.sql      # Simple SELECT, WHERE, GROUP BY, ORDER BY queries
│   ├── joins.sql                 # LEFT JOIN and INNER JOIN examples
│   ├── groupby-having.sql        # Aggregation queries using GROUP BY + HAVING
│   ├── subquery-cte.sql          # Subquery and CTE (WITH) examples
│   ├── window-func.sql           # Window functions (ROW_NUMBER, RANK, SUM OVER)
│   └── optimization.sql          # Index creation and query optimization
│
└── README.md
```

## Query Categories

### 1. Simple Queries (`5_simple_queries.sql`)
- List of customers from Germany
- Employees with more than 10 years of experience, ranked by title
- Average product price
- Top 5 most expensive products
- Top 10 companies by number of orders placed

### 2. Join Queries (`joins.sql`)
- Products ↔ Categories (LEFT JOIN)
- Customers ↔ Orders (INNER JOIN)
- Products ↔ Suppliers (INNER JOIN)
- Orders ↔ Customers ↔ Employees (multiple INNER JOINs)
- Order Details ↔ Orders ↔ Products (multiple INNER JOINs)

### 3. Grouping and Filtering (`groupby-having.sql`)
- Product count and average price by category (categories with more than 5 products, using `HAVING`)
- Monthly order count and total sales volume for the year 2016

### 4. Subquery and CTE (`subquery-cte.sql`)
- Finding products priced above the average price — using both a subquery and a CTE (`WITH`)

### 5. Window Functions (`window-func.sql`)
- Ranking by price using `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`
- Ranking within each category using `PARTITION BY`
- Calculating a running total within an order using `SUM() OVER()`

### 6. Optimization (`optimization.sql`)
- Creating an index on the `orderdate` column
- Performance comparison between a correlated subquery and a JOIN + GROUP BY approach

## Technology Used

- PostgreSQL
- Northwind sample database

## How to Use

1. Set up the Northwind database in PostgreSQL.
2. Open and run the `.sql` files in the `notebooks/` folder sequentially, using any SQL client (pgAdmin, DBeaver, etc.) or `psql`.

```bash
psql -U postgres -d northwind -f notebooks/joins.sql
```

## Purpose

This repository was created to practice the core topics of SQL — joins, aggregation, subqueries/CTEs, window functions, and query optimization through indexing — in a hands-on way using real Northwind data.
