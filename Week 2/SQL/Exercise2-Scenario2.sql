DELIMITER $$
CREATE PROCEDURE UpdateSalary(
  IN employeeId INT,
  IN percentage DECIMAL(5,2)
)
BEGIN
  DECLARE employeeNotFound CONDITION FOR SQLSTATE '42000';

  START TRANSACTION;

  UPDATE employees SET salary = salary * (1 + percentage / 100) WHERE EmployeeID = employeeId;

  IF ROW_COUNT() = 0 THEN
    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Employee not found';
  END IF;

  COMMIT;

  -- Log successful update
  INSERT INTO salary_update_log (employee_id, new_salary, status)
  VALUES (employeeId, (SELECT salary FROM employees WHERE EmployeeID = employeeId), 'success');

  -- Error handling
  DECLARE exit handler FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    -- Log general error
    INSERT INTO salary_update_log (employee_id, new_salary, status)
    VALUES (employeeId, NULL, 'failed - unexpected error');
  END;

  DECLARE exit handler FOR employeeNotFound
  BEGIN
    ROLLBACK;
    -- Log error
    INSERT INTO salary_update_log (employee_id, new_salary, status)
    VALUES (employeeId, NULL, 'failed - employee not found');
  END;
END $$
DELIMITER ;


SELECT * FROM sys.employees;