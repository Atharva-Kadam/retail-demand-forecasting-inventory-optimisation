-- Monthly Sales Trend
SELECT 
    EXTRACT(MONTH FROM Date) AS month,
    SUM(Sales) AS total_sales
FROM sales_data
GROUP BY month
ORDER BY month;

-- Promotion Impact
SELECT 
    Promo,
    AVG(Sales) AS avg_sales
FROM sales_data
GROUP BY Promo;

-- Top Stores
SELECT 
    Store,
    SUM(Sales) AS total_sales
FROM sales_data
GROUP BY Store
ORDER BY total_sales DESC
LIMIT 10;

-- Store Ranking (Window Function)
SELECT 
    Store,
    Date,
    Sales,
    RANK() OVER (PARTITION BY Store ORDER BY Sales DESC) AS sales_rank
FROM sales_data;