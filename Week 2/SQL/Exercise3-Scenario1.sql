DELIMITER $$
CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN
  UPDATE accounts
  SET balance = balance * 1.01  -- Assuming 1% interest rate
  WHERE AccountType = 'Savings';
END $$
DELIMITER ;


SELECT * FROM sys.accounts;