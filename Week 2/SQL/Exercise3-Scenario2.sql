DELIMITER $$
CREATE PROCEDURE UpdateEmployeeBonus(IN department VARCHAR(50), IN bonusPercentage DECIMAL(5,2))
BEGIN
  UPDATE employees
  SET salary = salary * (1 + bonusPercentage / 100)
  WHERE Department = department;
END $$
DELIMITER ;


SELECT * FROM sys.employees;