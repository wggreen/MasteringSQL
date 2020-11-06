SELECT
	et.name AS department, count(make.vehicle_make_id) AS nissan_sales
FROM sales
INNER JOIN vehicles v
ON v.vehicle_id = sales.vehicle_id
INNER JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
INNER JOIN vehiclemake make
ON make.vehicle_make_id = vt.make
INNER JOIN employees e
ON e.employee_id = sales.employee_id
INNER JOIN employeetypes et
ON et.employee_type_id = e.employee_type_id
WHERE vt.make = 3
GROUP BY et.name
ORDER BY Nissan_sales DESC