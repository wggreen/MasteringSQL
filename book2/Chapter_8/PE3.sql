SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee_name, SUM(sales.price) AS total_sales
FROM sales
INNER JOIN employees e
ON e.employee_id = sales.employee_id
WHERE sales.sales_type_id = 1 OR sales.sales_type_id = 2
GROUP BY employee_name
ORDER BY total_sales DESC