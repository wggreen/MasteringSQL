-- A Sales associate needs to update a sales record because her customer want to pay with a Mastercard
-- instead of JCB. Update Customer, Ernestus Abeau Sales record which has an invoice number of 9086714242.
UPDATE sales
SET payment_method = 'mastercard'
WHERE invoice_number = '9086714242';

SELECT * FROM sales
WHERE invoice_number = '9086714242'