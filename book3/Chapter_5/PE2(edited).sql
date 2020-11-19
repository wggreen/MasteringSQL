-- Create a trigger for updates to the Sales table.
-- If the pickup date is on or before the purchase date, 
-- set the pickup date to 7 days after the purchase date. 
-- If the pickup date is after the purchase date but less than 7 days out from the purchase date, 
-- add 4 additional days to the pickup date.
CREATE OR REPLACE FUNCTION conditionally_set_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
	IF NEW.pickup_date > NEW.purchase_date AND NEW.pickup_date <= NEW.purchase_date  + integer '7' THEN
	  UPDATE sales
	  SET pickup_date = NEW.pickup_date + integer '4'
	  WHERE sales.sale_id = NEW.sale_id;
	ELSIF NEW.pickup_date <= NEW.purchase_date THEN
	  UPDATE sales
	  SET pickup_date = NEW.purchase_date + integer '7'
	  WHERE sales.sale_id = NEW.sale_id;
	END IF;
  RETURN NULL;
END;
$$

CREATE TRIGGER update_sale_made_pickup_date
  AFTER UPDATE
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE conditionally_set_pickup_date();
-- OR
CREATE OR REPLACE FUNCTION conditionally_set_pickup_date() 
  RETURNS TRIGGER 
  LANGUAGE PlPGSQL
AS $$
BEGIN
	IF NEW.pickup_date > NEW.purchase_date AND NEW.pickup_date <= NEW.purchase_date  + integer '7' THEN
	  NEW.pickup_date := NEW.pickup_date + integer '4';
	ELSIF NEW.pickup_date <= NEW.purchase_date THEN
	  NEW.pickup_date := NEW.purchase_date + integer '7';
	END IF;
  RETURN NEW;
END;
$$

CREATE TRIGGER update_sale_made_pickup_date
  BEFORE UPDATE
  ON sales
  FOR EACH ROW
  EXECUTE PROCEDURE conditionally_set_pickup_date();
  
UPDATE sales
SET pickup_date = CURRENT_DATE + integer '2';
WHERE sale_id = 1005;	

SELECT * FROM sales
ORDER BY sale_id DESC;
DROP FUNCTION conditionally_set_pickup_date;
DROP TRIGGER update_sale_made_pickup_date ON sales;