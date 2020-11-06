SELECT d.business_name, COUNT(CASE WHEN s.sale_id = 1 THEN 1 ELSE 0 END) AS sales, COUNT(CASE WHEN s.sale_id = 2 THEN 1 ELSE 0 END) AS leases
FROM dealerships d
LEFT JOIN sales s
	ON s.dealership_id = d.dealership_id
GROUP BY d.dealership_id
ORDER BY d.dealership_id ASC