SELECT model.name, COUNT(model.name) AS inventory from vehicles
INNER JOIN 	vehicletypes vt
ON vt.vehicle_type_id = vehicles.vehicle_type_id
INNER JOIN vehiclemodel model
ON model.vehicle_model_id = vt.model
GROUP BY model.name
ORDER BY inventory DESC