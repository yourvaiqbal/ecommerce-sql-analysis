-- =====================================================
-- Project: E-Commerce Data Analysis
-- Author: Ahmad Iqbal Maulana
-- Layer: Staging Validation (PostgreSQL)
-- =====================================================

-- =====================================================
-- 1. ORDERS VALIDATION
-- =====================================================

-- Row count
SELECT COUNT(*) AS total_rows
FROM staging.orders_raw;

-- NULL check (PK)
SELECT COUNT(*) AS null_order_id
FROM staging.orders_raw
WHERE order_id IS NULL;

-- Duplicate check (PK)
SELECT order_id, COUNT(*) AS cnt
FROM staging.orders_raw
GROUP BY order_id
HAVING COUNT(*) > 1;

-- FK check: order tanpa customer
SELECT COUNT(*) AS missing_customer_fk
FROM staging.orders_raw o
LEFT JOIN staging.customers_raw c
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- Date sanity (pastikan tipe timestamp)
-- Jika kolom bertipe text, cast dulu: order_purchase_timestamp::timestamp
SELECT COUNT(*) AS invalid_future_date
FROM staging.orders_raw
WHERE order_purchase_timestamp::timestamp > NOW();

-- Sample
SELECT *
FROM staging.orders_raw
LIMIT 10;


-- =====================================================
-- 2. CUSTOMERS VALIDATION
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM staging.customers_raw;

SELECT COUNT(DISTINCT customer_id) AS distinct_customer_id,
       COUNT(DISTINCT customer_unique_id) AS distinct_customer_unique_id
FROM staging.customers_raw;

-- NULL check
SELECT COUNT(*) AS null_customer_id
FROM staging.customers_raw
WHERE customer_id IS NULL;


-- =====================================================
-- 3. ORDER ITEMS VALIDATION
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM staging.order_items_raw;

-- Distribution
SELECT order_id, COUNT(*) AS items_per_order
FROM staging.order_items_raw
GROUP BY order_id
ORDER BY items_per_order DESC
LIMIT 10;

-- Negative values
SELECT COUNT(*) AS invalid_negative_values
FROM staging.order_items_raw
WHERE price < 0 OR freight_value < 0;

-- FK check: missing product
SELECT COUNT(*) AS missing_product_fk
FROM staging.order_items_raw oi
LEFT JOIN staging.products_raw p
  ON oi.product_id = p.product_id
WHERE p.product_id IS NULL;

-- FK check: missing seller
SELECT COUNT(*) AS missing_seller_fk
FROM staging.order_items_raw oi
LEFT JOIN staging.sellers_raw s
  ON oi.seller_id = s.seller_id
WHERE s.seller_id IS NULL;


-- =====================================================
-- 4. PAYMENTS VALIDATION
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM staging.payments_raw;

-- Distribution
SELECT order_id, COUNT(*) AS payments_per_order
FROM staging.payments_raw
GROUP BY order_id
ORDER BY payments_per_order DESC
LIMIT 10;

-- Negative values
SELECT COUNT(*) AS invalid_negative_payment
FROM staging.payments_raw
WHERE payment_value < 0;

-- Order tanpa payment
SELECT COUNT(*) AS orders_without_payment
FROM staging.orders_raw o
LEFT JOIN staging.payments_raw p
  ON o.order_id = p.order_id
WHERE p.order_id IS NULL;


-- =====================================================
-- 5. CROSS TABLE VALIDATION
-- =====================================================

-- Orphan order_items (tidak ada di orders)
SELECT COUNT(*) AS orphan_order_items
FROM staging.order_items_raw oi
LEFT JOIN staging.orders_raw o
  ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;
