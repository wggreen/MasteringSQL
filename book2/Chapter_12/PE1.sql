CREATE VIEW bodytypes_makes_model2 AS
	SELECT
		make.name AS make,
		body.name AS body,
		model.name AS model
	FROM vehicletypes vt
	INNER JOIN vehiclemake make on make.vehicle_make_id = vt.make
	INNER JOIN vehiclebodytype body on body.vehicle_body_type_id = vt.body_type
	INNER JOIN vehiclemodel model on model.vehicle_model_id = vt.model
	GROUP BY make.name, body.name, model.name;
	
SELECT * from bodytypes_makes_model2
ORDER BY model ASC;