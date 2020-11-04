SELECT v.vehicle_id, v.exterior_color, v.interior_color, b.name AS bodytype, make.name AS make, model.name AS model FROM vehicles v
INNER JOIN vehicletypes
	ON v.vehicle_type_id = vehicletypes.vehicle_type_id
INNER JOIN vehiclebodytype b
	ON vehicletypes.body_type = b.vehicle_body_type_id
INNER JOIN vehiclemake make
	ON vehicletypes.make = make.vehicle_make_id
INNER JOIN vehiclemodel model
	ON vehicletypes.model = model.vehicle_model_id