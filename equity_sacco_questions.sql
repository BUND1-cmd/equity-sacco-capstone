-- ============================================================
-- EQUITY SACCO KENYA LTD — BUSINESS SQL QUESTIONS
-- Database: equity_sacco_db
-- Instructions: Write all queries yourself. No peeking.
-- These are real questions a SACCO CFO or auditor would ask.
-- ============================================================

USE equity_sacco_db;


-- ============================================================
-- Q1: TOTAL ASSET BASE
-- ============================================================
-- What is the total asset base of the SACCO?
-- Total deposits across all active accounts.
-- Display: one number — total_deposits_kes
-- Hint: SUM balance_ke from accounts where status = 'active'
select sum(balance_ke)
from accounts
where status in ("active")

-- ============================================================
-- Q2: LOAN PORTFOLIO BY TYPE
-- ============================================================
-- What is the total loan portfolio value broken down by loan_type?
-- Display: loan_type, total_principal_kes, number_of_loans
-- Order by total_principal_kes descending.
select loan_type,
     sum(principal_kes) as total_principal_kes,
     count(loan_id) as number_of_loans
from loans
group by loan_type,loan_id
order by total_principal_kes desc

-- ============================================================
-- Q3: NPL RATIO (Non-Performing Loan Ratio)
-- ============================================================
-- What percentage of our loan portfolio is non-performing?
-- NPL = (total principal of Defaulted loans / total principal of all loans) * 100
-- Display: total_portfolio_kes, npl_amount_kes, npl_ratio_pct
-- Hint: Use two subqueries or CASE WHEN inside SUM
select 
   sum(principal_kes) as total_portfolio_kes,
   sum(case when status = "defaulted" then principal_kes else 0 end) as npl_amount_kes,
   round(
    (sum(case when status="defaulted" then principal_kes else 0 end)/sum(principal_kes))*100,
    2
   ) as npl_ratio_pct
from loans;


-- ============================================================
-- Q4: MEMBERS BEHIND ON REPAYMENTS
-- ============================================================
-- Find all active loans where total amount repaid is less than 30% of principal.
-- These are members at risk of defaulting.
-- Display: member full_name, loan_type, principal_kes, 
--          total_repaid, repayment_rate_pct
-- Hint: JOIN loans → repayments → members
--       GROUP BY loan, HAVING repayment_rate < 30
SELECT
     members.full_name,
     loans.loan_type,
     loans.principal_kes,
     COALESCE(sum(repayments.amount_paid_kes),0) as total_repaid,
     round(
        (COALESCE(sum(repayments.amount_paid_kes),0)/(loans.principal_kes))*100,
        2
     )as repayment_rate_pct
from loans
join members on loans.member_id= members.member_id
left join repayments on loans.loan_id = repayments.loan_id
where loans.status in ("active")
group by loans.loan_type,loans.loan_id,members.full_name,loans.principal_kes
having repayment_rate_pct <30

-- ============================================================
-- Q5: MONTHLY INCOME VS EXPENDITURE TREND
-- ============================================================
-- Show the P&L for each month in 2024.
-- Display: month_number, month_name, total_income_kes, 
--          total_expenditure_kes, net_profit_kes
-- Order by month_number ascending.
-- Hint: Use CASE WHEN inside SUM, GROUP BY MONTH(entry_date)


-- ============================================================
-- Q6: LARGE TRANSACTION AUDIT FLAG
-- ============================================================
-- Flag all transactions above KES 100,000 for audit review.
-- These need to be investigated by the audit team.
-- Display: transaction_id, account_number, member full_name, 
--          amount_kes, transaction_date, channel, description
-- Order by amount_kes descending.
-- Hint: JOIN transactions → accounts → members


-- ============================================================
-- Q7: LOAN TO DEPOSIT RATIO
-- ============================================================
-- What is the SACCO's loan-to-deposit ratio?
-- Formula: (Total loan portfolio / Total deposits) * 100
-- A ratio above 80% is a liquidity warning for SACCOs.
-- Display: total_loans_kes, total_deposits_kes, ldr_ratio_pct
-- Hint: Use two subqueries in a single SELECT


-- ============================================================
-- Q8: MEMBERSHIP GROWTH TREND
-- ============================================================
-- How is membership growing over time?
-- Display: join_year, join_month, new_members, cumulative_total
-- Order by join_year, join_month ascending.
-- Hint: COUNT with GROUP BY YEAR/MONTH + 
--       SUM() OVER (ORDER BY year, month) for cumulative


-- ============================================================
-- BONUS: OFFICER ACTIVITY AUDIT
-- ============================================================
-- Which member processed the most transactions?
-- (The processed_by column tracks who handled each transaction)
-- Display: officer full_name, total_transactions_processed, 
--          total_amount_processed_kes
-- Order by total_transactions_processed descending.


-- ============================================================
-- END OF QUESTIONS
-- Good luck. Take your time on Q3, Q5, and Q8 — 
-- those are the ones that will appear in real job interviews.
-- ============================================================
