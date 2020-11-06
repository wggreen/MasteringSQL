SELECT d.business_name, SUM(sales.price) AS total_sales
FROM sales
INNER JOIN dealerships d
ON d.dealership_id = sales.dealership_id
WHERE (SELECT EXTRACT(YEAR FROM sales.purchase_date)) = (EXTRACT(YEAR FROM CURRENT_DATE))
GROUP BY d.business_name
ORDER BY total_sales DESC