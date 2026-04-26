E-Commerce Sales Analysis (SQL + Dashboard)

Project Overview

This project analyzes e-commerce sales data using SQL and presents insights through an interactive dashboard. The goal is to demonstrate strong analytical thinking, SQL proficiency, and the ability to communicate business insights visually.

⸻

Objectives

* Analyze sales performance over time
* Identify top-performing products and categories
* Understand customer purchasing behavior
* Provide actionable business insights

⸻

Tools and Technologies

* SQL (PostgreSQL / MySQL / BigQuery) – Data querying and analysis
* Power BI / Tableau / Looker Studio – Data visualization and dashboard
* Excel (optional) – Data validation

⸻

Dataset

The dataset contains transactional e-commerce data, including:

* Order ID
* Order Date
* Customer ID
* Product Name
* Category
* Quantity
* Price
* Total Sales

⸻

Project Structure

ecommerce-sales-analysis/
│
├── data/
│   ├── raw/                  # Original dataset
│   ├── processed/            # Cleaned dataset (if applicable)
│
├── sql/
│   ├── schema.sql            # Table creation
│   ├── data_cleaning.sql     # Cleaning queries
│   ├── analysis.sql          # Business analysis queries
│
├── dashboard/
│   ├── dashboard.pbix        # Power BI file or dashboard export
│   ├── dashboard_link.txt    # Public dashboard URL (if available)
│
├── images/
│   ├── dashboard_preview.png
│
├── README.md

⸻

SQL Analysis Highlights

Key queries included in this project:

* Total revenue by month
* Top 10 products by sales
* Revenue by category
* Customer segmentation (repeat vs new)
* Average order value (AOV)

Example:

SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_sales) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

⸻

Dashboard Features

The dashboard provides:

* Revenue trend over time
* Top products and categories
* Sales distribution
* Key performance indicators (KPI):
    * Total Revenue
    * Total Orders
    * Average Order Value

⸻

Dashboard Preview

⸻

How to Run

1. Setup Database

Create a database and run:

-- schema
sql/schema.sql

-- optional cleaning
sql/data_cleaning.sql

2. Run Analysis

Execute:

sql/analysis.sql

Use tools such as:

* DBeaver
* PostgreSQL
* MySQL

⸻

3. Open Dashboard

* Open dashboard.pbix using Power BI Desktop
* Or open the public dashboard link from:

dashboard/dashboard_link.txt

⸻

Skills Demonstrated

* SQL querying (aggregation, grouping, filtering)
* Data modeling (basic schema design)
* Business analysis and KPI definition
* Data visualization and storytelling

⸻

Future Improvements

* Add more advanced SQL (window functions, cohort analysis)
* Optimize queries for performance
* Automate data refresh for dashboard

⸻

Author

Ahmad Iqbal Maulana
Aspiring Data Analyst
LinkedIn: https://www.linkedin.com/in/ahmad-iqbal-maulana-9669b8228
GitHub: https://github.com/yourvaiqbal
