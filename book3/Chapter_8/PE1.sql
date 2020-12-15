INSERT INTO public.vehiclemake(
	name)
	VALUES ('Honda');
	
INSERT INTO vehiclemodel(
	name)
	VALUES('CRV');
	
INSERT INTO vehicletypes(
	body_type, make, model)
	VALUES(4, 6, 17);

-- start a transaction
BEGIN;
-- You can also use BEGIN TRANSACTION; or BEGIN WORK;

-- insert a new row into the sales type table

-- Adding 5 brand new 2021 Honda CR-Vs to the inventory.
-- They have I4 engines and are classified as a Crossover SUV or CUV.
-- All of them have beige interiors
-- but the exterior colors are Lilac, Dark Red, Lime, Navy and Sand. 
-- The floor price is $21,755 and the MSR price is $18,999.

INSERT INTO public.vehicles(
	vin, engine_type, vehicle_type_id, exterior_color, interior_color, floor_price, msr_price, miles_count, year_of_car, is_sold, is_new, dealership_location_id)
	VALUES ('555', 'I4', 31, 'Lilac', 'Beige', 21755, 18999, 0, 2021, false, true, 1),
	('556', 'I4', 31, 'Dark Red', 'Beige', 21755, 18999, 0, 2021, false, true, 2),
	('557', 'I4', 31, 'Lime', 'Beige', 21755, 18999, 0, 2021, false, true, 3),
	('558', 'I4', 31, 'Navy', 'Beige', 21755, 18999, 0, 2021, false, true, 4),
	('559', 'I4', 31, 'Sand', 'Beige', 21755, 18999, 0, 2021, false, true, 5);
	
SAVEPOINT afterinsertion;

-- commit the change
COMMIT;
-- You can also use COMMIT TRANSACTION; or COMMIT WORK;

SELECT * FROM vehicles
WHERE engine_type = 'I4';
