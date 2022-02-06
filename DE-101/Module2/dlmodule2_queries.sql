-- Total sales
SELECT
	ROUND(SUM(sales), 2) AS total_sales
FROM
	orders;
	
-- Total profit
SELECT
	ROUND(SUM(profit), 2) AS total_profit
FROM
	orders;
	
-- Profit ratio
SELECT
	ROUND(SUM(profit) / SUM(sales), 2) AS profit_ratio
FROM
	orders;
	
-- Profit per order
SELECT
	order_id,
	ROUND(SUM(profit), 2)
FROM
	orders
GROUP BY
	order_id;
	
-- Average profit per order
SELECT
	ROUND(SUM(profit) / COUNT(DISTINCT order_id), 2) AS avg_profit_per_order
FROM
	orders;
	
-- Sales per customer
SELECT
	customer_id,
	ROUND(SUM(sales), 2)
FROM
	orders
GROUP BY
	customer_id;
	
-- Average sales per customer
SELECT
	ROUND(SUM(sales) / COUNT(DISTINCT customer_id), 2) AS avg_sales_per_customer
FROM
	orders;
	
-- Average discount
SELECT
	ROUND(AVG(discount), 2) AS average_discount
FROM
	orders;
	
-- Monthly sales by segment
SELECT
	segment,
	EXTRACT(year from ship_date) AS year,
	EXTRACT(month from ship_date) AS month,
	SUM(sales)
FROM
	orders
GROUP BY
	segment,
	year,
	month
ORDER BY
	1, 2, 3;
	
-- Monthly sales by product category
SELECT
	category,
	EXTRACT(year from ship_date) AS year,
	EXTRACT(month from ship_date) AS month,
	SUM(sales)
FROM
	orders
GROUP BY
	category,
	year,
	month
ORDER BY
	1, 2, 3;
	
-- Sales by product category over time
SELECT 
	category,
	ROUND(SUM(sales), 2) AS total_sales
FROM
	orders
GROUP BY
	category
ORDER BY
	1;
	
-- Sales and profit by customer
SELECT
	customer_id,
	customer_name,
	ROUND(SUM(sales), 2) AS sales,
	ROUND(SUM(profit), 2) AS profit
FROM
	orders
GROUP BY
	customer_id,
	customer_name
ORDER BY
	2;
	
-- Customer ranking by profit
SELECT
	customer_id,
	customer_name,
	ROUND(SUM(sales), 2) AS sales,
	ROUND(SUM(profit), 2) AS profit
FROM
	orders
GROUP BY
	customer_id,
	customer_name
ORDER BY
	4 DESC;
	
-- Sales per region
SELECT
	region,
	ROUND(SUM(sales), 2) AS sales
FROM
	orders
GROUP BY
	region
ORDER BY
	2 DESC;