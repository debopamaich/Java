DELIMITER $$
CREATE PROCEDURE AddCustomer(
  IN p_customerId INT,
  IN p_name VARCHAR(100),
  IN p_dob DATE,
  IN p_balance INT
)
BEGIN
  INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
  VALUES (p_customerId, p_name, p_dob, p_balance, NOW());
END $$

CREATE PROCEDURE UpdateCustomer(
  IN p_customerId INT,
  IN p_name VARCHAR(100),
  IN p_dob DATE,
  IN p_balance INT
)
BEGIN
  UPDATE Customers
  SET Name = p_name, DOB = p_dob, Balance = p_balance, LastModified = NOW()
  WHERE CustomerID = p_customerId;
END $$

CREATE FUNCTION GetCustomerBalance(p_customerId INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_balance INT;
  SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_customerId;
  RETURN v_balance;
END $$
DELIMITER ;


SELECT * FROM sys.customers;