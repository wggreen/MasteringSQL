-- start a transaction
BEGIN;
-- You can also use BEGIN TRANSACTION; or BEGIN WORK;

SAVEPOINT foo;

INSERT INTO public.carrepairtypelogs(
	date_occured, vehicle_id, repair_type_id)
	VALUES (CURRENT_DATE, 651, 21), (CURRENT_DATE, 651, 22);
	
INSERT INTO public.oilchangelogs(
	date_occured, vehicle_id)
	VALUES (CURRENT_DATE, 651);

COMMIT;

ROLLBACK

SELECT * FROM carrepairtypelogs where vehicle_id = 651