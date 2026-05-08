-- Total revenue
SELECT SUM(revenue) AS total_revenue
FROM sales_raw;

-- Revenue by month
SELECT
    STRFTIME('%Y-%m', order_date) AS month,
    SUM(revenue) AS monthly_revenue
FROM sales_raw
GROUP BY month
ORDER BY month;

-- Revenue by region
SELECT
    region,
    SUM(revenue) AS region_revenue
FROM sales_raw
GROUP BY region
ORDER BY region_revenue DESC;

-- Top 5 products
SELECT
    product,
    SUM(revenue) AS product_revenue
FROM sales_raw
GROUP BY product
ORDER BY product_revenue DESC
LIMIT 5;
