SELECT name, COUNT(e.employee_id) as total_employees FROM employeetypes et
INNER JOIN employees e
ON e.employee_type_id = et.employee_type_id
GROUP BY name
ORDER BY total_employees DESC