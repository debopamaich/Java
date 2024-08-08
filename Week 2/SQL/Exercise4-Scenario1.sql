DELIMITER $$
CREATE FUNCTION CalculateAge(birthdate DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE age INT;
  SET age = YEAR(CURDATE()) - YEAR(birthdate) - (RIGHT(CURDATE(), 5) < RIGHT(birthdate, 5));
  RETURN age;
END $$
DELIMITER ;


SELECT * FROM sys.customers;