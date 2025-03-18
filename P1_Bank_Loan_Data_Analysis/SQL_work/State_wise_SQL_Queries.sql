-- P27: STATE: 
SELECT address_state AS State, 
count(id) as total_loan_applications,
SUM(loan_amount) as total_funded_amount,
SUM(total_payment) as total_amount_received
FROM dbo.bank_loan_data
GROUP BY address_state
ORDER BY address_state;