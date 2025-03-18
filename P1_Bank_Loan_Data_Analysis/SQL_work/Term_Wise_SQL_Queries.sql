-- P28: TERM WISE: 
SELECT term as Term, COUNT(id) AS total_loan_applications,
SUM(loan_amount) AS total_funded_amount,
SUM(total_payment) AS total_amount_received
FROM dbo.bank_loan_data
GROUP BY term;