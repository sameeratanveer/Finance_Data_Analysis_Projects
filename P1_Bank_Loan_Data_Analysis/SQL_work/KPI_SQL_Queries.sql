USE BankLoanDB;

SELECT * FROM dbo.bank_loan_data;

-- P1: Calculate Total Loan applications.. 
SELECT COUNT(id) AS 'Total_Loan_applications'
FROM dbo.bank_loan_data;

-- P2: MTD Total loan applications.. 
SELECT COUNT(id) AS MTD_Loan_Applications
FROM dbo.bank_loan_data
WHERE  Month(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data)
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- P3 PMTD Total Loan applications..
SELECT COUNT(id) AS PMTD_Total_Loan_Applications
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data) - 1
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- P3: MoM Loan Applications? 

-- P4: Total Funded amount.. (loan_amount)
SELECT SUM(loan_amount) as Total_Funded_Amount
FROM dbo.bank_loan_data;

-- P5: MTD Funded Amount: (loan_amount) 
SELECT SUM(loan_amount) AS MTD_Funded_Amount
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data)
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM bank_loan_data);

-- p6: PMTD Funded Amount: 
SELECT SUM(loan_amount) AS PMTD_Funded_Amount
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data) - 1
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM bank_loan_data);

-- P7: Total amount Received..
SELECT SUM(total_payment) as Total_Amount_Received
FROM dbo.bank_loan_data;

-- P8: MTD Amount Received...
SELECT SUM(total_payment) as MTD_Amount
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data)
AND
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- OR 
SELECT SUM(total_payment) as MTD_Amount
FROM dbo.bank_loan_data
WHERE MONTH(last_payment_date) = (SELECT MONTH(MAX(last_payment_date)) FROM dbo.bank_loan_data)
AND
YEAR(last_payment_date) = (SELECT YEAR(MAX(last_payment_date)) FROM dbo.bank_loan_data);

-- P9 - PMTD Amount Received..
SELECT SUM(total_payment) as PMTD_Amount_Received
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data) - 1
AND
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- or 
SELECT SUM(total_payment) as PMTD_Amount_received
FROM dbo.bank_loan_data
WHERE MONTH(last_payment_date) = (SELECT MONTH(MAX(last_payment_date)) FROM dbo.bank_loan_data) -1
AND
YEAR(last_payment_date) = (SELECT YEAR(MAX(last_payment_date)) FROM dbo.bank_loan_data);

-- P10 : AVG INTEREST RATE: 
SELECT AVG(int_rate)*100 AS AVG_interest_rate
FROM dbo.bank_loan_data;

-- P11: MTD INTEREST RATE:
SELECT AVG(int_rate)*100 AS AVG_MTD_interest_rate 
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data)
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- P12: PMTD INTEREST RATE: 
SELECT AVG(int_rate)*100 AS AVG_PMTD_interest_rate 
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data) - 1
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);

-- P13: AVG DTI 
SELECT AVG(dti)*100 AS AVG_dti
FROM dbo.bank_loan_data;

-- P14: MTD DTI..
SELECT AVG(dti)*100 AS AVG_MTD_dti
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = 12;

-- P15: PMTD DTI 
SELECT AVG(dti)*100 AS AVG_PMTD_dti
FROM dbo.bank_loan_data
WHERE MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data) - 1
AND 
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data);