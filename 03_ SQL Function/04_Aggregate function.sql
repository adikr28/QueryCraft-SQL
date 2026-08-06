SELECT
customerID,
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MAX(sales) AS highest_sales,
MIN(sales) AS lowest_sales
FROM sales.orders
group by CustomerID
