DELIMITER $$
CREATE PROCEDURE TransferFunds(IN sourceAccountId INT, IN targetAccountId INT, IN amount DECIMAL(10,2))
BEGIN
  DECLARE insufficientFunds CONDITION FOR SQLSTATE '42000';

  START TRANSACTION;

  SELECT balance INTO @sourceBalance FROM accounts WHERE AccountID = sourceAccountId;

  IF @sourceBalance < amount THEN
    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Insufficient funds';
  END IF;

  UPDATE accounts SET balance = balance - amount WHERE AccountID = sourceAccountId;
  UPDATE accounts SET balance = balance + amount WHERE AccountID = targetAccountId;

  COMMIT;
END $$
DELIMITER ;


SELECT * FROM sys.accounts;