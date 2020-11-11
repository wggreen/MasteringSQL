CREATE PROCEDURE return_car(
	IN p_sale_id integer,
	IN p_vehicle_id integer,
	IN p_date_occured timestamp with time zone
)
LANGUAGE plpgsql
AS $$
BEGIN

UPDATE sales
	SET sale_returned = true
	WHERE sale_id = p_sale_id;

INSERT INTO oilchangelogs(date_occured, vehicle_id)
VALUES (p_date_occured, p_vehicle_id);

END
$$;

CALL return_car(5006, 1, '2020-11-10 00:00-06');