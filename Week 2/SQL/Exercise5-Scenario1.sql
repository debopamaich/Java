DELIMITER $$
CREATE TRIGGER UpdateCustomerLastModified
AFTER UPDATE ON Customers
FOR EACH ROW
BEGIN
  UPDATE Customers
  SET LastModified = NOW()
  WHERE CustomerID = OLD.CustomerID;
END $$
DELIMITER ;


SELECT * FROM sys.customers;