ALTER TABLE Customers
ADD COLUMN IsVIP BOOLEAN DEFAULT FALSE;

UPDATE Customers
SET IsVIP = TRUE
WHERE Balance > 10000;

SELECT * FROM sys.customers;