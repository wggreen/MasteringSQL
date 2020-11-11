SELECT
	model.name,
	COUNT(model.vehicle_model_id) AS stock
FROM vehicles v
JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
JOIN vehiclemodel model
ON model.vehicle_model_id = vt.model
GROUP BY model.name
ORDER BY stock