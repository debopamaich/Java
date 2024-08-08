DELIMITER $$
CREATE PROCEDURE ApplyAnnualFee(IN annualFee DECIMAL(10,2))
BEGIN
  UPDATE accounts
  SET balance = balance - annualFee;
END $$
DELIMITER ;


SELECT * FROM sys.accounts;