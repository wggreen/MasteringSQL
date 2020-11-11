SELECT
	vm.name,
	SUM(s.price)
FROM sales s
INNER JOIN vehicles v on v.vehicle_id = s.vehicle_id
INNER JOIN vehicletypes vt on vt.vehicle_type_id = v.vehicle_type_id
INNER JOIN vehiclemodel vm on vm.vehicle_model_id = vt.model
GROUP BY vm.vehicle_model_id
ORDER BY SUM(s.price) DESC
LIMIT 1;