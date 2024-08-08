DELIMITER $$
CREATE FUNCTION HasSufficientBalance(accountId INT, amount DECIMAL(10,2))
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
  DECLARE balance DECIMAL(10,2);

  SELECT balance INTO balance FROM accounts WHERE AccountID = accountId;

  IF balance >= amount THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;
END $$
DELIMITER ;


SELECT * FROM sys.accounts;