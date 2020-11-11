SELECT
	d.business_name,
	SUM(s.price)
FROM sales s
INNER JOIN dealerships d on d.dealership_id = s.dealership_id
GROUP BY d.dealership_id
ORDER BY SUM(s.price) DESC
LIMIT 5;