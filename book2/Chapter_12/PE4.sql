CREATE VIEW sales2018 AS
	SELECT
  		st.name,
  		COUNT(s.sale_id)
	FROM salestypes st
	JOIN sales s
	ON s.sales_type_id = st.sales_type_id
	WHERE (SELECT EXTRACT(YEAR FROM s.purchase_date)) = 2018
	GROUP BY st.name;
	
SELECT * from sales2018 