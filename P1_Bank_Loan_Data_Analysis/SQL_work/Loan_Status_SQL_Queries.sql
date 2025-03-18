USE BankLoanDB;
-- P24: Loan Status: loancount, total amount received, total funded amount, interest rate,dti..
SELECT loan_status, COUNT(id) LoanCount,
SUM(total_payment) Total_Amount_Received,
SUM(loan_amount) Total_funded_Amount,
AVG(int_rate)*100 avg_int_rate,
AVG(dti)*100 avg_dti
FROM dbo.bank_loan_data
GROUP BY loan_status;

-- P25: Loan Status: MTD amount received, MTD funded amount:
SELECT loan_status, 
SUM(total_payment) MTD_Amount_Received,
SUM(loan_amount) MTD_funded_amount
FROM dbo.bank_loan_data
WHERE 
MONTH(issue_date) = (SELECT MONTH(MAX(issue_date)) FROM dbo.bank_loan_data)
AND
YEAR(issue_date) = (SELECT YEAR(MAX(issue_date)) FROM dbo.bank_loan_data)
GROUP BY loan_status;