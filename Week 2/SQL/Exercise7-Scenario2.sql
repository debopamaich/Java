DELIMITER $$
CREATE PROCEDURE HireEmployee(
  IN p_employeeId INT,
  IN p_name VARCHAR(100),
  IN p_position VARCHAR(50),
  IN p_salary INT,
  IN p_department VARCHAR(50),
  IN p_hireDate DATE
)
BEGIN
  INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
  VALUES (p_employeeId, p_name, p_position, p_salary, p_department, p_hireDate);
END $$

CREATE PROCEDURE UpdateEmployee(
  IN p_employeeId INT,
  IN p_name VARCHAR(100),
  IN p_position VARCHAR(50),
  IN p_salary INT,
  IN p_department VARCHAR(50)
)
BEGIN
  UPDATE Employees
  SET Name = p_name, Position = p_position, Salary = p_salary, Department = p_department
  WHERE EmployeeID = p_employeeId;
END $$

CREATE FUNCTION CalculateAnnualSalary(p_employeeId INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE v_salary INT;
  SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_employeeId;
  RETURN v_salary * 12;
END $$
DELIMITER ;


SELECT * FROM sys.employees;