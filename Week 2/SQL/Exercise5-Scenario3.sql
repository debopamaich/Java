DELIMITER $$
CREATE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
  DECLARE availableBalance DECIMAL(10,2);

  SELECT balance INTO availableBalance FROM accounts WHERE AccountID = NEW.AccountID;

  IF NEW.TransactionType = 'Withdrawal' AND NEW.Amount > availableBalance THEN
    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Insufficient funds';
  ELSEIF NEW.TransactionType = 'Deposit' AND NEW.Amount <= 0 THEN
    SIGNAL SQLSTATE '42000' SET MESSAGE_TEXT = 'Deposit amount must be positive';
  END IF;
END $$
DELIMITER ;


SELECT * FROM sys.transactions;