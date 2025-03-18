# Objective, Domain Knowledge, Reason for choosing this project:
## Objective
In this project, I analyzed bank loan data and built an interactive dashboard to gain insights into loan trends and borrower behaviors. Bank loans are essential financial tools that help individuals and businesses achieve financial goals. However, understanding loan terms, costs, and responsibilities is crucial for making informed decisions.

## Domain Knowledge
Banks gather loan data through various channels, including loan applications, credit reports, internal records, online platforms, and third-party data sources. The loan application process involves multiple stages, including application submission, identity verification, credit checks, income verification, and risk assessment, ultimately leading to loan approval or denial. The bank's goal is to ensure that the borrower can repay the loan based on their financial situation.

## Reason for choosing this Project
This project was chosen because of the importance of data analysis in banking and financial decision-making. Analyzing loan data helps banks assess risk, manage portfolios, ensure regulatory compliance, and make data-driven lending decisions. Moreover, the ability to detect fraud, optimize loan pricing, and understand customer behaviors is essential for improving bank operations and profitability.

By building a dashboard with this loan data, I aimed to visualize key metrics, such as loan approval rates, default risks, and portfolio performance, ultimately helping the bank make informed decisions, manage risks, and better serve customers.

# DASHBOARD REQUIREMENTS, Problem Statement: 
## Dashboard 1: SUMMARY 
#### 1. Total Loan Applications: 
We need to calculate the total number of loan applications received during a specified period. Additionally, it is essential to monitor the Month-to-Date (MTD) Loan Applications and track changes Month-over-Month (MoM).
#### 2. Total Funded Amount: 
Understanding the total amount of funds disbursed as loans is crucial. We also want to keep an eye on the MTD Total Funded Amount and analyse the Month-over-Month (MoM) changes in this metric.
#### 3. Total Amount Received: 
Tracking the total amount received from borrowers is essential for assessing the bank's cash flow and loan repayment. We should analyse the Month-to-Date (MTD) Total Amount Received and observe the Month-over-Month (MoM) changes.
#### 4. Average Interest Rate: Calculating the average interest rate across all loans, MTD, and monitoring the Month-over-Month (MoM) variations in interest rates will provide insights into our lending portfolio's overall cost.
#### 5. Average Debt-to-Income Ratio (DTI): Evaluating the average DTI for our borrowers helps us gauge their financial health. We need to compute the average DTI for all loans, MTD, and track Month-over-Month (MoM) fluctuations.

## Dashboard 2: OVERVIEW: 
CHARTS
#### 1. Monthly Trends by Issue Date (Line Chart):  
To identify seasonality and long-term trends in lending activities
#### 2. Regional Analysis by State (Filled Map): 
To identify regions with significant lending activity and assess regional disparities
#### 3. Loan Term Analysis (Donut Chart): 
To allow the client to understand the distribution of loans across various term lengths.
#### 4. Employee Length Analysis (Bar Chart): 
How lending metrics are distributed among borrowers with different employment lengths, helping us assess the impact of employment history on loan applications.
#### 5. Loan Purpose Breakdown (Bar Chart): 
Will provide a visual breakdown of loan metrics based on the stated purposes of loans, aiding in the understanding of the primary reasons borrowers seek financing.
#### 6. Home Ownership Analysis (Tree Map): 
For a hierarchical view of how home ownership impacts loan applications and disbursements.
Metrics to be shown: 'Total Loan Applications,' 'Total Funded Amount,' and 'Total Amount Received'

## Dashbaord 3: DETAILS:
GRID
Need for a comprehensive 'Details Dashboard' that provides a consolidated view of all the essential information within our loan data. This Details Dashboard aims to offer a holistic snapshot of key loan-related metrics and data points, enabling users to access critical information efficiently.
##### Objective:
The primary objective of the Details Dashboard is to provide a comprehensive and user-friendly interface for accessing vital loan data. It will serve as a one-stop solution for users seeking detailed insights into our loan portfolio, borrower profiles, and loan performance.

# Worflow of the Bank loan Data analysis Project: 
For this project, I followed a simple process to get the data, clean it, and build a dashboard. Here’s how I did it:

##### 1. Get the Data & Problem Statement:

First, I got the bank loan data and the problem statement. The problem statement helped me understand what to focus on, like loan approval rates, defaults, repayments, and risks.
##### 2. Data Extraction with MS SQL Server:

➥ I used MS SQL Server to write queries and get all the KPIs (key metrics) and other important data.
➥ I made sure to check the data to be sure everything was correct and aligned with the problem statement.
##### 3. Documenting SQL Queries & Results:

➥ After running the queries, I saved the SQL queries and the results in a Word document.
➥ This document is available in the GitHub repository so others can check it and see how I got the data.
##### 4. Import Data & Clean It in Power BI:

➥ Next, I imported the data from MS SQL Server into Power BI.
➥ I did some cleaning and transforming of the data, like:
1.  Fixing date formats.
2. Creating a calendar table for better time analysis.
3. Making sure the data matched the KPIs and problem statement.
##### 5. Building the Power BI Dashboard:

➥ After cleaning and transforming the data, I built a 3-page navigable dashboard in Power BI.
➥ The dashboard shows the key metrics and makes it easy to understand loan trends, risks, and performance.
##### 6. Verification:

➥ Finally, I checked the values in Power BI to make sure they matched the results from MS SQL Server.
➥ The values matched, so I knew the data and dashboard were accurate.

#### The whole process helped me understand how to use SQL and Power BI to analyze loan data and make good decisions.




