SELECT
	CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
	SUM(s.price) AS total_sales
FROM sales s
JOIN employees e
ON e.employee_id = s.employee_id
GROUP BY employee_name
ORDER BY total_sales DESC
LIMIT 5;
	