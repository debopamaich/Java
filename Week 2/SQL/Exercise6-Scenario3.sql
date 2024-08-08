DELIMITER $$
CREATE PROCEDURE UpdateLoanInterestRates(IN newInterestRate DECIMAL(5,2))
BEGIN
  UPDATE loans
  SET InterestRate = newInterestRate;
END $$
DELIMITER ;


SELECT * FROM sys.loans;