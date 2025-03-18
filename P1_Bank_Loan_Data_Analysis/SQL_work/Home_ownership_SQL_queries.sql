-- P31: Home ownership: 
SELECT home_ownership, 
COUNT(id) AS total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_amount_received
FROM dbo.bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;