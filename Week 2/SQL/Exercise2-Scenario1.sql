DELIMITER $$
CREATE PROCEDURE SafeTransferFunds(
  IN sourceAccountId INT,
  IN targetAccountId INT,
  IN amount DECIMAL(10,2)
)
BEGIN
  DECLARE insufficientFundsCondition CONDITION FOR SQLSTATE '42000';

  START TRANSACTION;
  
  SELECT balance INTO @sourceBalance FROM accounts WHERE AccountID = sourceAccountId;
  
  IF @sourceBalance < amount THEN
    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Insufficient funds';
  END IF;
  
  UPDATE accounts SET balance = balance - amount WHERE AccountID = sourceAccountId;
  UPDATE accounts SET balance = balance + amount WHERE AccountID = targetAccountId;
  
  COMMIT;
  
  -- Log successful transfer
  INSERT INTO transfer_log (source_account, target_account, amount, status)
  VALUES (sourceAccountId, targetAccountId, amount, 'success');
  
EXCEPTION
  WHEN insufficientFundsCondition THEN
    ROLLBACK;
    -- Log error
    INSERT INTO transfer_log (source_account, target_account, amount, status)
    VALUES (sourceAccountId, targetAccountId, amount, 'failed - insufficient funds');
  WHEN SQLEXCEPTION THEN
    ROLLBACK;
    -- Log general error
    INSERT INTO transfer_log (source_account, target_account, amount, status)
    VALUES (sourceAccountId, targetAccountId, amount, 'failed - unexpected error');
END $$
DELIMITER ;



SELECT * FROM sys.customers;