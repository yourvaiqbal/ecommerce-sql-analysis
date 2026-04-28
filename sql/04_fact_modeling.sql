-- =====================================================
-- Project: E-Commerce Data Analysis
-- Author: Ahmad Iqbal Maulana
-- Layer: Fact Modeling
-- =====================================================

-- =====================================================
-- FACT TABLE: fact_orders
-- Grain: one row per order
-- =====================================================

DROP TABLE IF EXISTS public.fact_orders;

CREATE TABLE public.fact_orders AS
SELECT *
FROM (
    WITH payment_agg AS (
        SELECT
            order_id,
            SUM(payment_value) AS total_payment_value
        FROM staging.payments_raw
        GROUP BY order_id
    ),
    order_items_agg AS (
        SELECT
            order_id,
            SUM(price) AS total_price,
            SUM(freight_value) AS total_freight,
            COUNT(DISTINCT product_id) AS total_products,
            COUNT(DISTINCT seller_id) AS total_sellers
        FROM staging.order_items_raw
        GROUP BY order_id
    )
    SELECT
        o.order_id,
        o.customer_id,
        (o.order_purchase_timestamp::timestamp)::date AS order_date,
        COALESCE(oi.total_price, 0) AS total_price,
        COALESCE(oi.total_freight, 0) AS total_freight,
        COALESCE(p.total_payment_value, 0) AS total_payment_value,
        COALESCE(oi.total_products, 0) AS total_products,
        COALESCE(oi.total_sellers, 0) AS total_sellers
    FROM staging.orders_raw o
    LEFT JOIN order_items_agg oi
        ON o.order_id = oi.order_id
    LEFT JOIN payment_agg p
        ON o.order_id = p.order_id
    WHERE o.order_id IS NOT NULL
) t;


-- =====================================================
-- DATA QUALITY CHECK (FACT)
-- =====================================================

-- 1. Check duplicate order_id (harus 0)
SELECT order_id, COUNT(*)
FROM public.fact_orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- 2. Check NULL critical fields
SELECT COUNT(*) AS null_order_id
FROM public.fact_orders
WHERE order_id IS NULL;

-- 3. Check NULL metrics (harus 0 karena pakai COALESCE)
SELECT COUNT(*) AS null_payment
FROM public.fact_orders
WHERE total_payment_value IS NULL;

-- 4. Check negative values (harus 0)
SELECT *
FROM public.fact_orders
WHERE total_payment_value < 0
   OR total_price < 0
   OR total_freight < 0;

-- 5. Basic sanity check (sample data)
SELECT *
FROM public.fact_orders
LIMIT 10;
