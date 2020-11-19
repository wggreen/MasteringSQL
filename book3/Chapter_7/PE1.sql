BEGIN
-- add new role
IF NOT EXISTS
	(INSERT INTO employeetypes (name)
	 	VALUES('Automotive Mechanic'))
		
-- add new employee
INSERT INTO employees (first_name, last_name, email_address, phone, employee_type_id)

SAVEPOINT
-- set employees at dealership
ROLLBACK