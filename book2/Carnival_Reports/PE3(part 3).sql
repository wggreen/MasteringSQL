SELECT
	bt.name,
	COUNT(bt.vehicle_body_type_id) AS stock
FROM vehicles v
JOIN vehicletypes vt
ON vt.vehicle_type_id = v.vehicle_type_id
JOIN vehiclebodytype bt
ON bt.vehicle_body_type_id = vt.body_type
GROUP BY bt.name
ORDER BY stock