-- =====================================================
-- Project: E-Commerce Data Analysis
-- Author: Ahmad Iqbal Maulana
-- Layer: Analysis / Metrics (FINAL)
-- =====================================================


-- =========================
-- 1. TOTAL REVENUE
-- =========================
SELECT 
    SUM(total_payment_value) AS total_revenue
FROM public.fact_orders;


-- =========================
-- 2. TOTAL ORDERS
-- =========================
SELECT 
    COUNT(*) AS total_orders
FROM public.fact_orders;


-- =========================
-- 3. AVERAGE ORDER VALUE (AOV)
-- =========================
SELECT 
    ROUND(AVG(total_payment_value)::numeric, 2) AS avg_order_value
FROM public.fact_orders;


-- =========================
-- 4. MONTHLY REVENUE TREND
-- =========================
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_payment_value) AS revenue
FROM public.fact_orders
GROUP BY month
ORDER BY month;


-- =========================
-- 5. TOP CUSTOMERS
-- =========================
SELECT
    customer_id,
    SUM(total_payment_value) AS total_spent,
    COUNT(order_id) AS total_orders
FROM public.fact_orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;


-- =========================
-- 6. REVENUE LEAKAGE CHECK
-- =========================
SELECT *
FROM public.fact_orders
WHERE total_price <> total_payment_value
LIMIT 10;


-- =========================
-- 7. MONTHLY GROWTH (ADVANCED)
-- =========================
WITH monthly AS (
    SELECT
        DATE_TRUNC('month', order_date) AS MONTH,
        SUM(total_payment_value) AS revenue
    FROM
        public.fact_orders
    GROUP BY
        DATE_TRUNC('month', order_date)
)
SELECT
    MONTH,
    revenue,
    LAG(revenue) OVER (
    ORDER BY
        MONTH
    ) AS prev_month,
    ROUND(
        CAST(
            (revenue - LAG(revenue) OVER (ORDER BY MONTH))
            /
            NULLIF(LAG(revenue) OVER (ORDER BY MONTH), 0)
            * 100
        AS NUMERIC),
    2) AS growth_pct
FROM
    monthly
ORDER BY month;
