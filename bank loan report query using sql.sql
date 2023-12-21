
select * loan_details_data

A. BANK LOAN REPORT-SUMMARY
KPIs: 

Total Loan Applications

select count(id) AS Total_applications from loan_details_data


MTD Loan Applications

select count(id) AS Total_applications from loan_details_data
where month(issue_date) = 12



PMTD Loan Applications

select count(id) AS Total_applications from loan_details_data
where month(issue_date) = 11



Total Funded Amount

select sum(loan_amount) AS Total_Funded_Amount from loan_details_data



MTD Total Funded Amount

select sum(loan_amount) AS Total_Funded_Amount from loan_details_data
where month(issue_date) = 12


PMTD Total Funded Amount

select sum(loan_amount) AS Total_Funded_Amount from loan_details_data
where month(issue_date) = 11


Total Amount Received

select sum(total_payment) AS Total_Amount_Collected from loan_details_data



MTD Total Amount Received

select sum(total_payment) AS Total_Amount_Collected from loan_details_data
where month(issue_date) = 12



PMTD Total Amount Received

select sum(total_payment) AS Total_Amount_Collected from loan_details_data
where month(issue_date) = 11




Average Interest Rate

select avg(int_rate)*100 AS Avg_Int_Rate from loan_details_data


MTD Average Interest

select avg(int_rate)*100 AS MTD_Avg_Int_Rate from loan_details_data
where month(issue_date) = 12


PMTD Average Interest

select avg(int_rate)*100 AS PMTD_Avg_Int_Rate from loan_details_data
where month(issue_date) = 11






AVG DTI
select avg(dti)*100 AS Avg_DTI from loan_details_data



MTD AVG DTI

select avg(dti)*100 AS MTD_Avg_DTI from loan_details_data
where month(issue_date) = 12



PMTD Avg DTI

select avg(dti)*100 AS PMTD_Avg_DTI from loan_details_data
where month(issue_date) = 11



GOOD LOAN ISSUED

Good Loan Percentage 

select
    (count(case when loan_status = 'Fully Paid' or loan_status = 'Current' then id 
end) * 100.0) /
    count(id) AS Good_Loan_Percentage
from loan_details_data    


Good Loan Application
select count(id) AS Good_Loan_Applications from loan_details_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



Good Loan Funded Amount
select sum(loan_amount) AS Good_Loan_Funded_amount from loan_details_data
where loan_status = 'Fully Paid' or loan_status = 'Current'


Good Loan Amount Received

select sum(total_payment) AS Good_Loan_amount_received from loan_details_data
where loan_status = 'Fully Paid' or loan_status = 'Current'



BAD LOAN ISSUED

Bad Loan Percentage 

select
    (count(case when loan_status = 'Charged Off' then id end) * 100.0) /
    count(id) AS Bad_Loan_Percentage
from loan_details_data    



BAD LOAN APPLICATIONS

select count(id) AS Bad_Loan_Applications from loan_details_data
where loan_status = 'Charged Off'




BAD LOAN FUNDED AMOUNT

select sum(loan_amount) AS Bad_Loan_Funded_amount from loan_details_data
where loan_status = 'Charged Off'





BAD LOAN AMOUNT RECEIVED

select sum(total_payment) AS Bad_Loan_amount_received from loan_details_data
where loan_status = 'Charged Off'





LOAN STATUS 

select
	loan_status,
    count(id) AS Loancount,
    sum(total_payment) AS Total_Amount_Received,
    sum(loan_amount) AS Total_Funded_Rate,
    avg(int_rate * 100) AS Interest_Rate,
    avg(dti * 100) AS DTI
from
    loan_details_data
group by 
	loan_status	




    
select 
	loan_status,
    sum(total_payment) AS MTD_Total_Amount_Received,
    sum(loan_amount) AS MTD_Total_Funded_Amount
from loan_details_data
where month(issue_date) = 12
group by loan_status   






















B. BANK LOAN REPORT-OVERVIEW

MONTH

SELECT 
    MONTH(issue_date) AS Month_Number,
    MONTHNAME(issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Amount_Received
FROM loan_details_data
GROUP BY MONTH(issue_date), MONTHNAME(issue_date)
ORDER BY MONTH(issue_date)


STATE

select
	address_state AS State,
    count(id) AS Total_Loan_Applications,
    sum(loan_amount) AS Total_Funded_Amount,
    sum(total_payment) AS Total_Amount_Received
from loan_details_data
group by address_state
order by address_state    


TERM

select 
	term AS Term,
	count(id) AS Total_loan_Applications,
    sum(loan_amount) AS Total_Funded_Amount,
    sum(total_payment) AS Total_Amount_Received
from loan_details_data
group by term
order by term  



EMPLOYEE LENGTH  

select
	emp_length AS Employee_length,
    count(id) AS Total_Loan_Applications,
    sum(loan_amount) AS Total_Funded_Amount,
    sum(total_payment) AS Total_Amount_Received
from loan_details_data
group by emp_length
order by emp_length   










PURPOSE

select
	purpose AS PURPOSE,
    count(id) AS Total_Loan_Applications,
    sum(loan_amount) AS Total_Funded_Amount,
    sum(total_payment) AS Total_Amount_Received
from loan_details_data
group by purpose
order by purpose    




HOME OWNERSHIP

select 
	home_ownership AS Home_Ownership,
    count(id) AS Total_Loan_Applications,
    sum(loan_amount) AS Total_Funded_Amount,
    sum(total_payment) AS Total_Amount_Received
from loan_details_data
group by home_ownership
order by home_ownership    




BANK LOAN REPORT QUERY DOCUMENT

