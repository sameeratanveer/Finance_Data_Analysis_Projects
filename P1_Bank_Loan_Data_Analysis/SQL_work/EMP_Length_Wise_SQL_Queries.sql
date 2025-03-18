-- P29: EmployeeLenght:
SELECT emp_length AS Employee_Length, 
COUNT(id) as Total_loan_applications,
SUM(loan_amount) AS total_amount_funded,
SUM(total_payment) AS total_amount_received
FROM dbo.bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;