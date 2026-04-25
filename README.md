# E-Commerce Data Analysis (SQL End-to-End Project)

## Overview
This project builds a structured data pipeline using PostgreSQL to analyze e-commerce performance.

The workflow covers:
- Raw data ingestion
- Data validation
- Data cleaning
- Dimensional modeling (star schema)
- Analytical queries for business insights

The objective is to demonstrate practical SQL skills in a real-world data scenario and showcase end-to-end analytical thinking.

---

## Tech Stack
- SQL (PostgreSQL)
- DBeaver
- GitHub

---

## Project Structure

ecommerce-analysis/
│
├── sql/
│   ├── 01_import.sql
│   ├── 02_staging_validation.sql
│   ├── 03_cleaning_dimensions.sql
│   ├── 04_fact_modeling.sql
│   └── 05_analysis_metrics.sql
│
├── assets/
│   ├── erd.png
│   └── dashboard.png
│
└── README.md
---

## Data Pipeline

### 1. Import Layer
- Raw CSV files are loaded into the staging schema
- No transformation is applied at this stage

### 2. Staging Validation
- Null value checks
- Duplicate detection
- Row count verification

### 3. Cleaning and Dimension Modeling
- Deduplication using ROW_NUMBER()
- Creation of dimension tables:
  - dim_customers
  - dim_products
- Enrichment of product categories using translation mapping

### 4. Fact Modeling
- Aggregation of transactional tables:
  - order_items → total_items, total_item_price
  - payments → total_payment_value
- Joined with orders to create:
  - fact_orders (one row per order)

### 5. Analysis Layer
- Revenue trends
- Order distribution
- Customer behavior
- Data consistency checks

---

## Data Model (Star Schema)

### fact_orders
- order_id (Primary Key)
- customer_id
- order_purchase_timestamp
- order_status
- total_items
- total_item_price
- total_payment_value

### dim_customers
- customer_unique_id
- customer_city
- customer_state

### dim_products
- product_id
- product_category_name
- product_category_name_en

---

## Key Insights

### Revenue Trend
Revenue shows strong growth during 2017–2018, with noticeable peaks toward the end of the year, indicating potential seasonality effects.

### Order Status Distribution
Approximately 97% of orders are successfully delivered, suggesting stable operational performance. The remaining orders are either canceled or unavailable.

### Revenue Consistency
There are discrepancies between:
- total_item_price
- total_payment_value

Possible explanations include discounts, shipping fees, or system-level adjustments.

### Customer Behavior
Most customers place only one or two orders, while a small segment contributes disproportionately to total revenue.

---

## Data Validation

- No duplicate order_id in the fact table
- Final row count: 99,441 orders
- Null checks performed in staging layer
- Aggregation logic prevents double counting

---

## How to Run

1. Load the dataset into PostgreSQL (via DBeaver or other client)
2. Execute SQL scripts in order:

01_import.sql
02_staging_validation.sql
03_cleaning_dimensions.sql
04_fact_modeling.sql
05_analysis_metrics.sql

---

## Key Learnings

- Data cleaning is critical before modeling
- Improper joins can lead to data duplication
- Aggregation must be handled carefully in transactional data
- A structured schema improves both performance and clarity
- SQL can be used to build complete data pipelines, not just queries

---

## Author

Ahmad Iqbal Maulana  
Aspiring Data Analyst with focus on SQL, Python, and Business Intelligence

---

## Notes

This project is part of a data analyst portfolio aimed at entry-level and remote opportunities.

Dataset: Brazilian E-Commerce Public Dataset (Olist)
