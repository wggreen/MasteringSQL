SELECT c.state, ROUND(AVG(s.price), 2) AS average
FROM sales s
JOIN customers c
ON c.customer_id = s.customer_id
WHERE s.sales_type_id = 1
GROUP BY c.state
ORDER BY average DESC