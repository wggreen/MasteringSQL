CREATE VIEW total_employees AS
  SELECT
  	et.name,
  	COUNT(e.employee_id) AS total_employees
	FROM employeetypes et
	JOIN employees e
	ON e.employee_type_id = et.employee_type_id
	GROUP BY et.name;
	
SELECT * from total_employees