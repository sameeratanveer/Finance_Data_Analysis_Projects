-- P26: Month: 
SELECT
MONTH(issue_date) as Month_Number,
DATENAME(mm, issue_date) AS Month_Name,
COUNT(id) AS total_loan_applications,
SUM(loan_amount) AS total_funded_Amount,
SUM(total_payment) AS total_amount_received
FROM dbo.bank_loan_data
GROUP BY MONTH(issue_date),
DATENAME(mm,issue_date)
ORDER BY MONTH(issue_date);