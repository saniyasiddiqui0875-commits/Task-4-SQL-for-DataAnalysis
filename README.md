# Task 4: SQL for Data Analysis

## Objective

The objective of this task was to use SQL queries to extract, manipulate, and analyze data from an e-commerce database.

## Tools Used

- SQL Server Management Studio (SSMS) 2022
- Microsoft SQL Server
- SQL

## Dataset

A sample e-commerce database was created for analysis containing three related tables:

- Customers
- Products
- Orders

## Database Structure

### Customers

Contains customer information such as:

- Customer ID
- Customer Name
- City
- Age
- Customer Segment

### Products

Contains product information such as:

- Product ID
- Product Name
- Category
- Unit Price

### Orders

Contains transaction information such as:

- Order ID
- Customer ID
- Product ID
- Order Date
- Quantity
- Discount
- Payment Method
- Order Status

## SQL Concepts Covered

The following SQL concepts were implemented:

1. SELECT statements
2. WHERE filtering
3. ORDER BY sorting
4. GROUP BY
5. Aggregate functions such as SUM(), AVG(), and COUNT()
6. INNER JOIN
7. LEFT JOIN
8. RIGHT JOIN
9. Subqueries
10. Views
11. Indexes
12. NULL value handling
13. Business-oriented data analysis

## Analysis Performed

The SQL queries were used to:

- Filter customers based on age
- Analyze revenue by product category
- Calculate total revenue and average order value
- Combine customer, product, and order information using joins
- Identify products priced above the average product price
- Create a customer sales analysis view
- Create an index to improve query performance
- Handle NULL values using ISNULL()
- Analyze revenue and orders across customer segments

## Key SQL Functions and Features

### Aggregate Functions

- SUM()
- AVG()
- COUNT()

### Joins

- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### Other SQL Features

- Subqueries
- Views
- Indexes
- ISNULL()
- GROUP BY
- ORDER BY
- WHERE

## Repository Contents

```text
Task-4-SQL-for-Data-Analysis/
│
├── Task_4_SQL_for_Data_Analysis.sql
├── README.md
│
└── screenshots/
    ├── 01_SELECT_WHERE_ORDERBY.png
    ├── 02_GROUPBY_AGGREGATES.png
    ├── 03_INNER_JOIN.png
    ├── 04_LEFT_JOIN.png
    ├── 05_RIGHT_JOIN.png
    ├── 06_SUBQUERY.png
    ├── 07_VIEW.png
    ├── 08_INDEX.png
    ├── 09_NULL_HANDLING.png
    └── 10_SEGMENT_ANALYSIS.png
