-- =========================================================
-- 1. TABLE CREATION
-- =========================================================

DROP TABLE IF EXISTS nike;

CREATE TABLE nike (
    sku_id SERIAL PRIMARY KEY,
    product_name VARCHAR(120),
    product_id VARCHAR(150) NOT NULL,
    listing_price NUMERIC(10,2),
    sale_price NUMERIC(10,2),
    discount INTEGER,
    brand VARCHAR(120),
    description TEXT,
    rating NUMERIC(2,1),
    reviews INTEGER
);


-- =========================================================
-- 2. DATA IMPORT
-- =========================================================

COPY nike(
    product_name,
    product_id,
    listing_price,
    sale_price,
    discount,
    brand,
    description,
    rating,
    reviews
)
FROM 'C:\\temp\\nike_shoes_sales.csv'
DELIMITER ','
CSV HEADER;

-- =========================================================
-- 3. DATA EXPLORATION
-- =========================================================

-- Count total rows
SELECT COUNT(*) AS total_rows
FROM nike;


-- View sample records
SELECT *
FROM nike
LIMIT 10;


-- Check NULL values
SELECT *
FROM nike
WHERE product_name IS NULL
   OR product_id IS NULL
   OR listing_price IS NULL
   OR sale_price IS NULL
   OR discount IS NULL
   OR brand IS NULL
   OR description IS NULL
   OR rating IS NULL
   OR reviews IS NULL;


-- Check NULL count by column
SELECT
    COUNT(*) FILTER (WHERE product_name IS NULL) AS product_name_nulls,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS product_id_nulls,
    COUNT(*) FILTER (WHERE listing_price IS NULL) AS listing_price_nulls,
    COUNT(*) FILTER (WHERE sale_price IS NULL) AS sale_price_nulls,
    COUNT(*) FILTER (WHERE discount IS NULL) AS discount_nulls,
    COUNT(*) FILTER (WHERE brand IS NULL) AS brand_nulls,
    COUNT(*) FILTER (WHERE description IS NULL) AS description_nulls,
    COUNT(*) FILTER (WHERE rating IS NULL) AS rating_nulls,
    COUNT(*) FILTER (WHERE reviews IS NULL) AS reviews_nulls
FROM nike;


-- Replace missing descriptions
UPDATE nike
SET description = 'No description available'
WHERE description IS NULL;


-- Check again for NULL values
SELECT *
FROM nike
WHERE product_name IS NULL
   OR product_id IS NULL
   OR listing_price IS NULL
   OR sale_price IS NULL
   OR discount IS NULL
   OR brand IS NULL
   OR description IS NULL
   OR rating IS NULL
   OR reviews IS NULL;


-- View unique product names
SELECT DISTINCT product_name
FROM nike
ORDER BY product_name;


-- Count products by sale price
SELECT
    sale_price,
    COUNT(*) AS product_count
FROM nike
GROUP BY sale_price
ORDER BY sale_price;


-- Products appearing multiple times
SELECT
    product_name,
    COUNT(*) AS number_of_skus
FROM nike
GROUP BY product_name
HAVING COUNT(*) > 1
ORDER BY number_of_skus DESC;


-- Check duplicate product IDs
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM nike
GROUP BY product_id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;


-- =========================================================
-- 4. DATA CLEANING
-- =========================================================

-- Check products with zero listing price
SELECT *
FROM nike
WHERE listing_price = 0;


-- Count zero listing-price records
SELECT COUNT(*) AS zero_listing_price_count
FROM nike
WHERE listing_price = 0;


-- Remove records where listing price is zero
DELETE FROM nike
WHERE listing_price = 0;


-- Verify remaining records
SELECT COUNT(*) AS remaining_rows
FROM nike;


-- =========================================================
-- 5. PRICE ANALYSIS
-- =========================================================

-- Calculate discount amount
SELECT
    product_name,
    listing_price,
    sale_price,
    listing_price - sale_price AS discount_amount
FROM nike;


-- Calculate discount percentage
SELECT
    product_name,
    listing_price,
    sale_price,
    ROUND(
        ((listing_price - sale_price) / listing_price) * 100,
        2
    ) AS discount_percentage
FROM nike
ORDER BY discount_percentage DESC;


-- =========================================================
-- 6. BASIC STATISTICS
-- =========================================================

SELECT
    MIN(sale_price) AS minimum_sale_price,
    MAX(sale_price) AS maximum_sale_price,
    ROUND(AVG(sale_price), 2) AS average_sale_price,
    MIN(rating) AS minimum_rating,
    MAX(rating) AS maximum_rating,
    ROUND(AVG(rating), 2) AS average_rating,
    SUM(reviews) AS total_reviews
FROM nike;


-- =========================================================
-- 7. BUSINESS QUESTIONS
-- =========================================================


-- Q1. Find the top 10 products with the highest discount percentage.

SELECT
    product_name,
    listing_price,
    sale_price,
    ROUND(
        ((listing_price - sale_price) / listing_price) * 100,
        2
    ) AS discount_percentage
FROM nike
ORDER BY discount_percentage DESC
LIMIT 10;


-- Q2. Which high-priced products have low customer ratings?

SELECT
    product_name,
    sale_price,
    rating
FROM nike
WHERE rating < 3.5
  AND sale_price > 10000
ORDER BY sale_price DESC;


-- Q3. Calculate an estimated product value using reviews
-- as a proxy. This is NOT actual revenue.

SELECT
    product_name,
    SUM(sale_price * reviews) AS estimated_product_value
FROM nike
GROUP BY product_name
ORDER BY estimated_product_value DESC;


-- Q4. Find products with a listing price above 15,000
-- and a discount below 30%.

SELECT
    product_name,
    listing_price,
    sale_price,
    ROUND(
        ((listing_price - sale_price) / listing_price) * 100,
        2
    ) AS discount_percentage
FROM nike
WHERE listing_price > 15000
  AND ((listing_price - sale_price) / listing_price) * 100 < 30
ORDER BY listing_price DESC;


-- Q5. Find the top 5 products with the highest
-- average discount percentage.

SELECT
    product_name,
    ROUND(
        AVG(
            ((listing_price - sale_price) / listing_price) * 100
        ),
        2
    ) AS average_discount_percentage
FROM nike
GROUP BY product_name
ORDER BY average_discount_percentage DESC
LIMIT 5;


-- Q6. Categorize products based on sale price.

SELECT
    product_name,
    sale_price,
    CASE
        WHEN sale_price < 6000 THEN 'Low Price'
        WHEN sale_price BETWEEN 6000 AND 10000 THEN 'Medium Price'
        ELSE 'Premium'
    END AS price_category
FROM nike;


-- Q7. Count products in each price category.

SELECT
    CASE
        WHEN sale_price < 6000 THEN 'Low Price'
        WHEN sale_price BETWEEN 6000 AND 10000 THEN 'Medium Price'
        ELSE 'Premium'
    END AS price_category,
    COUNT(*) AS total_products,
    ROUND(AVG(sale_price), 2) AS average_price
FROM nike
GROUP BY price_category
ORDER BY average_price;


-- Q8. Find the highest-rated products.

SELECT
    product_name,
    sale_price,
    rating,
    reviews
FROM nike
WHERE rating > 0
ORDER BY rating DESC, reviews DESC
LIMIT 10;


-- Q9. Find products with the highest number of reviews.

SELECT
    product_name,
    sale_price,
    rating,
    reviews
FROM nike
ORDER BY reviews DESC
LIMIT 10;


-- Q10. Compare average price and rating.

SELECT
    ROUND(AVG(sale_price), 2) AS average_sale_price,
    ROUND(AVG(rating), 2) AS average_rating
FROM nike;


-- =========================================================
-- 8. BRAND ANALYSIS
-- =========================================================

SELECT
    brand,
    COUNT(*) AS total_products,
    ROUND(AVG(sale_price), 2) AS average_sale_price,
    ROUND(AVG(rating), 2) AS average_rating,
    SUM(reviews) AS total_reviews
FROM nike
GROUP BY brand
ORDER BY total_products DESC;