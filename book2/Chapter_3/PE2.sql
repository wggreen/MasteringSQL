SELECT vin, c.first_name, c.last_name, e.first_name, e.last_name, d.business_name, d.city, d.state FROM public.sales
INNER JOIN public.vehicles
	ON sales.vehicle_id = vehicles.vehicle_id
INNER JOIN public.customers c
	ON sales.customer_id = c.customer_id
INNER JOIN public.employees e
	ON sales.employee_id = e.employee_id
INNER JOIN public.dealerships d
	ON sales.dealership_id = d.dealership_id