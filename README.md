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

This project analyzes the Brazilian Olist e-commerce dataset using SQL, following an end-to-end workflow from raw data ingestion to dashboard-ready analytical tables.

The project demonstrates data cleaning, transformation, dimensional modeling, and business metric generation.

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
│   ├── 01_data_import.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_data_transformation.sql
│   ├── 04_exploratory_analysis.sql
│   └── 05_business_metrics.sql
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
* Import CSV into staging

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

* Analyze patterns
* Validate data logic

⸻

05_business_metrics.sql

* Generate KPIs

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

* Power BI, link :
* Tableau, link :
* Looker Studio, link :

⸻

Key Insights

* Majority of orders come from Southeast Brazil
* Top categories drive most revenue
* Delivery delays vary by region
* Seller distribution is concentrated
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
