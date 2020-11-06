CREATE VIEW customers_names_only2 AS
  SELECT
  	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	c.company_name
	FROM customers c;
	
SELECT * from customers_names_only2