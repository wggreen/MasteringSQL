SELECT model.name, COUNT(model.name) AS model_sales from sales
INNER JOIN vehicles v
ON v.vehicle_id = sales.vehicle_id
INNER JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
INNER JOIN vehiclemodel model
ON model.vehicle_model_id = vt.model
WHERE sales_type_id = 2
GROUP BY model.name
ORDER BY model_sales DESC
