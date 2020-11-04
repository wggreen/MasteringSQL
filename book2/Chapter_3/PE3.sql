SELECT * from public.dealerships
INNER JOIN public.dealershipemployees
	ON dealerships.dealership_id = public.dealershipemployees.dealership_id
INNER JOIN public.employees
	ON dealershipemployees.employee_id = employees.employee_id
ORDER BY dealerships.dealership_id ASC