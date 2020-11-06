CREATE VIEW mostsales4 AS
	SELECT
  		CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
		d.business_name AS dealership,
		COUNT(e.employee_id) AS total_sales
	FROM sales s
	JOIN employees e
	ON e.employee_id = s.employee_id
	JOIN dealershipemployees de
	ON de.employee_id = e.employee_id
	JOIN dealerships d
	ON d.dealership_id = de.employee_id
	GROUP BY employee_name, d.business_name
	ORDER BY total_sales DESC;
	
SELECT * from mostsales4