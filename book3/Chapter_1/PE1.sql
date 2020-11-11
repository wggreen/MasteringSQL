-- Kristopher Blumfield an employee of Carnival has asked to be transferred to a different dealership location.
-- She is currently at dealership 9. She would like to work at dealership 20.
-- Update her record to reflect her transfer.
UPDATE  dealershipemployees
SET dealership_id = 20
WHERE employee_id = 9;

SELECT * FROM dealershipemployees
WHERE employee_id = 9