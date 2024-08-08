DELIMITER $$
CREATE FUNCTION CalculateMonthlyInstallment(loanAmount DECIMAL(10,2), interestRate DECIMAL(5,2), loanDurationYears INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE monthlyInterestRate DECIMAL(10,6);
  DECLARE numberOfPayments INT;

  SET monthlyInterestRate = interestRate / 12 / 100;
  SET numberOfPayments = loanDurationYears * 12;

  RETURN (loanAmount * monthlyInterestRate * POW((1 + monthlyInterestRate), numberOfPayments)) / (POW((1 + monthlyInterestRate), numberOfPayments) - 1);
END $$
DELIMITER ;


SELECT * FROM sys.loans;