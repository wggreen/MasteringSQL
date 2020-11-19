CREATE FUNCTION set_default_phone() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN 
	IF NEW.phone IS NULL THEN
		UPDATE dealerships
		SET phone = '777-111-0305'
		WHERE dealership_id = NEW.dealership_id;
	END IF;
RETURN NEW;
END
$$;

CREATE TRIGGER missing_phone
  AFTER INSERT
  ON dealerships
  FOR EACH ROW
  EXECUTE PROCEDURE set_default_phone();