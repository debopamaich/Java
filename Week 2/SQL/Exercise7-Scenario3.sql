DELIMITER $$
CREATE PROCEDURE OpenAccount(
  IN p_customerId INT,
  IN p_accountType VARCHAR(20),
  IN p_initialBalance INT
)
BEGIN
  INSERT INTO Accounts (CustomerID, AccountType, Balance, LastModified)
  VALUES (p_customerId, p_accountType, p_initialBalance, NOW());
END $$

CREATE PROCEDURE CloseAccount(IN p_accountId INT)
BEGIN
  DELETE FROM Accounts WHERE AccountID = p_accountId;
END $$

CREATE FUNCTION GetTotalCustomerBalance(p_customerId INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_totalBalance INT;
  SELECT SUM(Balance) INTO v_totalBalance FROM Accounts WHERE CustomerID = p_customerId;
  RETURN v_totalBalance;
END $$
DELIMITER ;


SELECT * FROM sys.accounts;