UPDATE loans l
JOIN customers c ON l.CustomerID = c.CustomerID
SET l.InterestRate = l.InterestRate * 0.99
WHERE TIMESTAMPDIFF(YEAR, c.DOB, CURDATE()) >= 60;

SELECT * FROM sys.loans;