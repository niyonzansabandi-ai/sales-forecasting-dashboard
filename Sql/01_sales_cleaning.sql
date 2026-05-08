-- Remove duplicate rows
DELETE FROM sales_raw
WHERE rowid NOT IN (
    SELECT MIN(rowid)
    FROM sales_raw
    GROUP BY order_id, product, region, order_date
);

-- Standardize date format
UPDATE sales_raw
SET order_date = DATE(order_date);

-- Handle missing values
UPDATE sales_raw
SET quantity = COALESCE(quantity, 0),
    price = COALESCE(price, 0),
    revenue = COALESCE(revenue, quantity * price);

-- Normalize text fields
UPDATE sales_raw
SET product = TRIM(product),
    region = TRIM(region);
