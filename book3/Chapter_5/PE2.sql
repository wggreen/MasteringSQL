CREATE FUNCTION fix_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
  -- trigger function logic
	UPDATE sales 
    SET pickup_date = CASE
		WHEN NEW.pickup_date <= purchase_date THEN NEW.pickup_date + integer '7'
		WHEN NEW.pickup_date <= (purchase_date + integer '7') THEN NEW.pickup_date + integer '4' 
    END 
	WHERE sales.sale_id = NEW.sale_id;  
  RETURN NULL;
END;
$$

CREATE TRIGGER sales_updated
  AFTER UPDATE ON sales
  FOR EACH ROW
  WHEN (OLD.* IS DISTINCT FROM NEW.*)
  EXECUTE PROCEDURE fix_pickup_date();