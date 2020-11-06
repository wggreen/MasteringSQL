SELECT d.business_name, COUNT(e.employee_id) AS finance_managers FROM dealerships d
INNER JOIN dealershipemployees de
ON de.dealership_id = d.dealership_id
INNER JOIN employees e
ON e.employee_id = de.employee_id
INNER JOIN employeetypes et
ON et.employee_type_id = e.employee_type_id
WHERE et.name = 'Finance Manager'
GROUP BY d.business_name
ORDER BY finance_managers DESC