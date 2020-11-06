SELECT make.name, COUNT(make.name) AS make_sales from sales
INNER JOIN vehicles v
ON v.vehicle_id = sales.vehicle_id
INNER JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
INNER JOIN vehiclemake make
ON make.vehicle_make_id = vt.make
WHERE sales_type_id = 1
GROUP BY make.name
ORDER BY make_sales DESC
