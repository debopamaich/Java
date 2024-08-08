CREATE TABLE AuditLog (
  AuditID INT AUTO_INCREMENT PRIMARY KEY,
  TransactionID INT,
  Operation VARCHAR(20),
  Timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
  INSERT INTO AuditLog (TransactionID, Operation)
  VALUES (NEW.TransactionID, 'Insert');
END $$
DELIMITER ;


SELECT * FROM sys.transactions;