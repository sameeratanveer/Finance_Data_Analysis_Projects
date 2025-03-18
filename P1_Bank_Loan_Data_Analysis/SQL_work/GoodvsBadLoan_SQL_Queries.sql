USE BankLoanDB;
-- p16: GOOD LOAN: 
-- What is Good loan? The loans which have fully paid... 
SELECT(COUNT(
CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100.0)/
COUNT(id) AS good_loan_percentage
FROM dbo.bank_loan_data;

-- P17 Good loan applications: 
SELECT(
COUNT( CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)) AS good_loan_applications
FROM dbo.bank_loan_data;

-- P18: Good Loan Funded Amount: 
SELECT
SUM(loan_amount) AS Good_loan_funded_Amount
FROM dbo.bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- P19: Good Loan Amount Received..
SELECT
SUM(total_payment) AS 'Good_Loan_Amount_Received'
FROM dbo.bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');

-- P20: Bad Loan Percentage: 
SELECT (
COUNT(
CASE WHEN loan_status='Charged Off' THEN id END
)*100.0 / COUNT(id)) as 'Bad_Loan_Percentage'
FROM dbo.bank_loan_data;

-- P21: Bad Loan Applications: 
SELECT 
COUNT(id) as 'Bad_Loan_Applications'
FROM dbo.bank_loan_data
WHERE loan_status='Charged Off';

-- P22: Bad Loan Funded Amount: 
SELECT
SUM(loan_amount) AS 'Bad_loan_funded_Amount'
FROM dbo.bank_loan_data
WHERE loan_status='Charged Off';

-- P23: Bad Loan Amount Received:
SELECT SUM(total_payment) Bad_Loan_Amount_Received
FROM dbo.bank_loan_data
WHERE loan_status='Charged Off';