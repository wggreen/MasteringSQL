-- An employee was recently fired so we must delete them from our database.
-- Delete the employee with employee_id of 35. What problems might you run into when deleting?
-- How would you recommend fixing it?
ALTER TABLE dealershipemployees
DROP CONSTRAINT dealershipemployees_employee_id_fkey

ALTER TABLE dealershipemployees
ADD CONSTRAINT dealershipemployees_employee_id_fkey
FOREIGN KEY (employee_id) REFERENCES Employees (employee_id)
ON DELETE CASCADE

ALTER TABLE sales
DROP CONSTRAINT sales_employee_id_fkey

ALTER TABLE sales
ADD CONSTRAINT sales_employee_id_fkey
FOREIGN KEY (employee_id) REFERENCES Employees (employee_id)
ON DELETE CASCADE

DELETE FROM employees
WHERE employee_id = 35