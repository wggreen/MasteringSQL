	SELECT
		make.name,
		COUNT(make.vehicle_make_id) AS stock
	FROM vehicles v
	JOIN vehicletypes vt
	ON vt.vehicle_type_id = v.vehicle_type_id
	JOIN vehiclemake make
	ON make.vehicle_make_id = vt.make
	GROUP BY make.name
	ORDER BY stock