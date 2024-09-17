USE bankdb;
SELECT * from bank_data;

-- KPI's | Summary Dahboard
-- Total Number Of Loan Applications

SELECT count(id) AS 'Total loan Applications'
FROM bank_data;

-- MTD Month to date
SELECT count(id) AS 'MTD_loan Applications'
FROM bank_data
WHERE month(issue_date) = 12;

-- PREV MTD Month to date
SELECT count(id) AS 'PMTD_Total_loan Applications'
FROM bank_data
WHERE month(issue_date) = 11;

-- Total Funded Amount
SELECT SUM(loan_amount) 'Total Funded Amount'
FROM bank_data;

-- MTD Month to date
SELECT sum(loan_amount) AS 'MTD Total Funded Amount'
FROM bank_data
WHERE month(issue_date) = 12;

-- PMTD Month to date
SELECT sum(loan_amount) AS 'PMTD Total Funded Amount'
FROM bank_data
WHERE month(issue_date) = 11;

-- Total Amount Recieved
SELECT sum(total_payment) AS 'Total Recieved Anount'
FROM bank_data;

-- MTD Month to date
SELECT sum(total_payment) AS 'MTD Total Recieved Amount'
FROM bank_data
WHERE month(issue_date) = 12;

-- PMTD Month to date
SELECT sum(total_payment) AS 'PMTD Total Recieved Amount'
FROM bank_data
WHERE month(issue_date) = 11;

-- Average Interest Rate
SELECT avg(int_rate) * 100 AS 'Average Interest Rate'
FROM bank_data;

-- MTD Month to date Average Interest Rate
SELECT AVG(int_rate) * 100 AS 'MTD Average Inerest Rate'
FROM bank_data
WHERE month(issue_date) = 12;

-- PMTD Month to date Average Interest Rate
SELECT AVG(int_rate) * 100 AS 'PMTD Average Interest Rate'
FROM bank_data
WHERE month(issue_date) = 11;

-- Average DTI
SELECT AVG(dti) * 100 AS 'Average DTI'
FROM bank_data;

-- MTD Month to date Average DTI
SELECT AVG(dti) * 100 AS 'MTD Average DTI'
FROM bank_data
WHERE month(issue_date) = 12;

-- PMTD Month to date Average DTI
SELECT AVG(dti) * 100 AS 'PMTD Average DTI'
FROM bank_data
WHERE month(issue_date) = 11;

-- Good Loan Applications Percentage
SELECT 
	(COUNT(CASE WHEN loan_status = "Fully Paid" or loan_status = "Current" THEN id END) * 100) / COUNT(ID) AS "Good Loan Percentage"
FROM bank_data;

-- Good Loan Applications
SELECT COUNT(ID) AS "Good Loan Applications"
FROM bank_data
WHERE loan_status = "Fully Paid" OR loan_status = "Current";

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS "Good Loan Funded Amount"
FROM bank_data
WHERE loan_status = "Fully Paid" OR loan_status = "Current";

-- Good Loan Recieved Amount
SELECT SUM(total_payment) AS "Good Loan Recieved Amount"
FROM bank_data
WHERE loan_status = "Fully Paid" OR loan_status = "Current";

-- Bad loan applications percentage
SELECT 
	(COUNT(CASE WHEN loan_status = "Charged Off" THEN id END) * 100) / COUNT(ID) AS "Bad Loan Percentage"
FROM bank_data;

-- Bad Loan Applications
SELECT COUNT(ID) AS "Bad Loan Applications"
FROM bank_data
WHERE loan_status = "Charged Off";

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS "Bad Loan Funded Amount"
FROM bank_data
WHERE loan_status = "Charged Off";

-- Bad Loan Recieved Amount
SELECT SUM(total_payment) AS "Bad Loan Recieved Amount"
FROM bank_dataD
WHERE loan_status = "Charged Off";

-- Grid View
SELECT 
	loan_status,
    COUNT(id) AS 'Total Loan Applications',
	SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount',
    AVG(int_rate)*100 AS 'Average Interest Rate',
    AVG(dti)*100 AS 'Average DTI'
FROM bank_data
GROUP BY loan_status;

-- ----------------
SELECT
	loan_status,
	SUM(loan_amount) AS 'MTD Total Funded Amount',
	SUM(total_payment) AS 'MTD Total Amount Recieed'
from bank_data
GROUP BY loan_status;
 -- -----------------------------------------------------------------------------
 
-- Bank Loan Report Overview
-- Month vise Data
SELECT
	MONTH(issue_date) AS 'Month Number',
    MONTHNAME(issue_date) AS 'Month Name',
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date);

-- State vise Date
SELECT
	address_state,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY address_state
order by address_state;

-- Term wise Bank Data
SELECT
	term,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY term
order by term;

-- Employees job security wise wise Bank Data
SELECT
	emp_length,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY emp_length
order by COUNT(id) DESC;


-- Purpose wise wise Bank Data
SELECT
	purpose,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY purpose
order by COUNT(id) DESC;

-- Purpose wise wise Bank Data
SELECT
	home_ownership,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
GROUP BY home_ownership
order by COUNT(id) DESC;

-- FILTERS YOU CAN CHAECK
-- EXMAPLE

SELECT
	purpose,
    COUNT(id) AS 'Total Loan Applications',
    SUM(loan_amount) AS 'Total Funded Amount',
    SUM(total_payment) AS 'Total Recieved Amount'
FROM bank_data
WHERE grade = 'A'
GROUP BY purpose
order by COUNT(id) DESC;
