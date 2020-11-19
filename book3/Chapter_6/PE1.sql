CREATE FUNCTION format_website() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN 
	UPDATE dealerships d
	SET website = CONCAT ('http://www.carnivalcars.com/', REPLACE(NEW.business_name, ' ', '_'))
	WHERE dealership_id = NEW.dealership_id;
RETURN NULL;
END
$$;

CREATE TRIGGER update_dealership
 	AFTER UPDATE OF 
			business_name, 
			phone, 
			city, 
			state, 
			tax_id 
	OR INSERT 
	ON dealerships
	FOR EACH ROW
	EXECUTE PROCEDURE format_website();