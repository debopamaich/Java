CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Balance INT,
    LastModified DATETIME
);

CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    Balance INT,
    LastModified DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Amount INT,
    TransactionType VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanAmount INT,
    InterestRate DECIMAL(5,2),  -- Using DECIMAL for better precision
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(50),
    Salary INT,
    Department VARCHAR(50),
    HireDate DATE
);


INSERT INTO Customers (CustomerID, Name, DOB, Balance, LastModified)
VALUES
  (1, 'John Doe', '1985-05-15', 1000, NOW()),
  (2, 'Jane Smith', '1990-07-20', 1500, NOW()),
  (3, 'Michael Johnson', '1978-11-02', 2500, NOW()),
  (4, 'Emily Brown', '1995-04-18', 800, NOW()),
  (5, 'David Lee', '1962-07-12', 3000, NOW());

INSERT INTO Accounts (AccountID, CustomerID, AccountType, Balance, LastModified)
VALUES
  (1, 1, 'Savings', 1000, NOW()),
  (2, 2, 'Checking', 1500, NOW()),
  (3, 3, 'Checking', 2000, NOW()),
  (4, 3, 'Savings', 500, NOW()),
  (5, 4, 'Checking', 700, NOW()),
  (6, 5, 'Savings', 3000, NOW());

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
  (1, 1, '2016-09-13', 200, 'Deposit'),
  (2, 2, '2014-05-15', 300, 'Withdrawal'),
  (3, 1, '2017-12-25', 500, 'Withdrawal'),
  (4, 2, '2015-03-10', 150, 'Deposit'),
  (5, 3, '2018-06-15', 300, 'Withdrawal'),
  (6, 4, '2019-01-08', 250, 'Deposit');

INSERT INTO Loans (LoanID, CustomerID, LoanAmount, InterestRate, StartDate, EndDate)
VALUES
  (1, 1, 5000, 5.00, '2018-09-25', '2025-06-03'),
  (2, 2, 15000, 5.00, '2018-09-25', '2025-06-03'),
  (3, 3, 7000, 4.5, '2020-11-12', '2027-05-15'),
  (4, 4, 3500, 3.8, '2022-02-20', '2028-09-10');

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, HireDate)
VALUES
  (1, 'Alice Johnson', 'Manager', 70000, 'HR', '2015-06-15'),
  (2, 'Bob Brown', 'Developer', 60000, 'IT', '2017-03-20'),
  (3, 'Sarah Miller', 'HR Specialist', 55000, 'HR', '2018-09-05'),
  (4, 'Daniel Kim', 'Software Engineer', 65000, 'IT', '2019-11-22');