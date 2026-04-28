-- =====================================================
-- Project: E-Commerce Data Analysis
-- Author: Ahmad Iqbal Maulana
-- Layer: Cleaning & Dimension Modeling
-- =====================================================

-- =====================================================
-- 1. DIM_CUSTOMERS
-- =====================================================

DROP TABLE IF EXISTS public.dim_customers;

CREATE TABLE public.dim_customers AS
SELECT DISTINCT
    customer_id,
    TRIM(customer_city) AS customer_city,
    TRIM(customer_state) AS customer_state
FROM staging.customers_raw
WHERE customer_id IS NOT NULL;


-- =====================================================
-- 2. DIM_PRODUCTS
-- =====================================================

DROP TABLE IF EXISTS public.dim_products;

CREATE TABLE public.dim_products AS
SELECT DISTINCT
    product_id,
    LOWER(TRIM(product_category_name)) AS product_category_name
FROM staging.products_raw
WHERE product_id IS NOT NULL;


-- =====================================================
-- 3. DIM_DATE (IMPORTANT FOR ANALYSIS)
-- =====================================================

DROP TABLE IF EXISTS public.dim_date;

CREATE TABLE public.dim_date AS
SELECT DISTINCT
    (order_purchase_timestamp::timestamp)::date AS order_date,
    EXTRACT(YEAR FROM order_purchase_timestamp::timestamp) AS year,
    EXTRACT(MONTH FROM order_purchase_timestamp::timestamp) AS month,
    EXTRACT(DAY FROM order_purchase_timestamp::timestamp) AS day
FROM staging.orders_raw;


-- =====================================================
-- 4. DATA QUALITY CHECK (DIMENSIONS)
-- =====================================================

-- Check duplicate customers
SELECT customer_id, COUNT(*)
FROM public.dim_customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check duplicate products
SELECT product_id, COUNT(*)
FROM public.dim_products
GROUP BY product_id
HAVING COUNT(*) > 1;

-- Check NULL category
SELECT COUNT(*) AS null_category
FROM public.dim_products
WHERE product_category_name IS NULL;