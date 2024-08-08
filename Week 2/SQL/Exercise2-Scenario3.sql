DELIMITER $$
CREATE PROCEDURE AddNewCustomer(
  IN customerID INT,
  IN name VARCHAR(100),
  IN dob DATE,
  IN balance INT
)
BEGIN
  DECLARE duplicateCustomer CONDITION FOR SQLSTATE '23000';
  
  START TRANSACTION;
  
  INSERT INTO customers (CustomerID, Name, DOB, Balance, LastModified)
  VALUES (customerID, name, dob, balance, NOW());
  
  COMMIT;
  
  -- Log successful insertion
  INSERT INTO customer_log (customer_id, status)
  VALUES (customerID, 'success');
  
EXCEPTION
  WHEN duplicateCustomer THEN ROLLBACK;
    -- Log error
    INSERT INTO customer_log (customer_id, status)
    VALUES (customerID, 'failed - duplicate customer');
  WHEN SQLEXCEPTION THEN
    ROLLBACK;
    -- Log general error
    INSERT INTO customer_log (customer_id, status)
    VALUES (customerID, 'failed - unexpected error');
END $$
DELIMITER ;


SELECT * FROM sys.customers;