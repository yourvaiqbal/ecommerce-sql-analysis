# E-Commerce Analytics (Brazilian Olist Dataset)

![SQL](https://img.shields.io/badge/SQL-MySQL8-blue)
![Stage](https://img.shields.io/badge/Stage-Analytics%20Engineering-green)
![Focus](https://img.shields.io/badge/Focus-SQL%20%2B%20Dashboard-orange)

⸻

SQL: MySQL 8

Focus: Analytics Engineering (SQL + Dashboard)

Model: Star Schema (Fact & Dimension Tables)

⸻

Project Overview

This project builds an end-to-end SQL data pipeline to transform raw Brazilian e-commerce data into a structured analytical model for business decision-making.

It simulates a real-world analytics workflow, starting from raw data ingestion to dashboard-ready datasets.

Key capabilities demonstrated:

* Designing layered data architecture (staging → warehouse)
* Data cleaning and validation
* Building dimensional models (fact and dimension tables)
* Generating business-ready metrics

⸻

Business Impact

This project enables:

* Monitoring revenue performance over time
* Understanding customer purchasing behavior
* Identifying high-performing products and regions
* Supporting data-driven decision making

The final dataset is designed to be directly connected to BI tools such as Power BI, Tableau, or Looker Studio.

⸻

Data Pipeline Overview

1. Import raw data
2. Store in staging layer
3. Clean and validate data
4. Transform into dimensional model
5. Generate business metrics
6. Connect to dashboard

⸻

Repository Structure

```
ecommerce-sql-analysis/
│
├── sql/
│   ├── 01_import.sql
│   ├── 02_staging_validation.sql
│   ├── 03_cleaning_dimensions.sql
│   ├── 04_fact_modeling.sql
│   └── 05_analysis_metrics.sql
│
├── diagrams/
│   ├── erd.png
│   └── pipeline_flowchart.png
│
├── dashboard/
│   ├── dashboard.pbix
│   └── dashboard_link.txt
│
├── images/
│   └── dashboard_preview.png
│
└── README.md
```

⸻

Data Architecture

Staging Layer (staging schema)

Raw data imported from CSV files.

Tables:

* customers_raw
* orders_raw
* order_items_raw
* payments_raw
* products_raw
* sellers_raw
* category_translation_raw

⸻

Data Warehouse Layer (public schema)

Cleaned and transformed analytical tables using dimensional modeling.

Tables:

* dim_customers
* dim_products
* fact_orders

⸻

SQL Pipeline (Execution Order)

01_data_import.sql

* Create database and schema
* Import CSV files into staging

⸻

02_data_cleaning.sql

* Trim text fields
* Standardize formats
* Fix data types
* Validate values

⸻

03_data_transformation.sql

* Join tables
* Build dimensional model

Creates:

* dim_customers
* dim_products
* fact_orders

⸻

04_exploratory_analysis.sql

* Analyze data patterns
* Validate data logic

⸻

05_business_metrics.sql

* Generate business KPIs

Includes:

* Total revenue
* Total orders
* Average order value
* Revenue by category

⸻

How to Run

1. Run 01_data_import.sql
2. Run 02_data_cleaning.sql
3. Run 03_data_transformation.sql
4. Run 04_exploratory_analysis.sql
5. Run 05_business_metrics.sql
6. Connect to dashboard

⸻

Dashboard

Connect tables from public schema to:

* Power BI
* Tableau
* Looker Studio

⸻

Key Insights

* Majority of revenue comes from Southeast Brazil
* A small number of categories drive most sales
* Delivery performance varies by region
* Seller distribution is highly concentrated
* Freight cost correlates with order value

⸻

Tech Stack

* MySQL 8
* SQL (Analytics Engineering)
* Data Modeling (Star Schema)
* Power BI / Tableau / Looker Studio

⸻

Author

Ahmad Iqbal Maulana

Aspiring Data Analyst

LinkedIn: https://www.linkedin.com/in/ahmad-iqbal-maulana-9669b8228

GitHub: https://github.com/yourvaiqbal

---
