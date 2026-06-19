-- ============================================================
-- KENYAN BANK LOAN PORTFOLIO — SQL DAILY PRACTICE
-- Database: kenyan_bank_db
-- Instructions: Work through one day at a time. 1 hour per day.
-- Write all queries yourself. No peeking at answers.
-- ============================================================

USE kenyan_bank_db;


-- ============================================================
-- DAY 1 — DATABASE SETUP (already done via kenyan_bank_db.sql)
-- ============================================================
-- Task: Confirm your data loaded correctly by running this check.
-- Expected results: branches=8, loan_officers=10, customers=15, loans=20, repayments=44

SELECT 'branches'     AS table_name, COUNT(*) AS row_count FROM branches
UNION ALL
SELECT 'loan_officers', COUNT(*) FROM loan_officers
UNION ALL
SELECT 'customers',     COUNT(*) FROM customers
UNION ALL
SELECT 'loans',         COUNT(*) FROM loans
UNION ALL
SELECT 'repayments',    COUNT(*) FROM repayments;


-- ============================================================
-- DAY 2 — BASIC RETRIEVAL (SELECT, WHERE, ORDER BY)
-- ============================================================

-- Q1: List all loans that are currently Active.
select * from loans
where status in ("active");
-- Q2: Find all customers who are from Nairobi county.
select * from customers
where county in ("nairobi");
-- Q3: Show all repayments where the amount paid is above KES 50,000.
--     Display: repayment_id, loan_id, amount_paid_kes, payment_date.
--     Order by amount_paid_kes descending.
select 
    repayment_id,
    loan_id,
    amount_paid_kes,
    payment_date
from repayments
where amount_paid_kes> 50000
order by amount_paid_kes desc;

-- Q4: List all loans ordered by disbursement_date from oldest to newest.
select * from loans
order by disbursement_date asc;
-- Q5: Find all loan officers who are currently active (is_active = 1).
--     Show their full_name and hire_date.
select full_name,
      hire_date
from loan_officers
where is_active in ("1");

-- Q6: Show all loans of type 'Agricultural' or 'Asset Finance'.
select * from loans
where loan_type in ("agricultural")
    or loan_type in ("asset finance");
-- Q7: Find all customers who joined after 1st January 2020.
--     Order by date_joined ascending.
select * from customers
where date_joined > '2020-01-01'
order by date_joined asc;

-- ============================================================
-- DAY 3 — AGGREGATIONS (GROUP BY, HAVING, aggregate functions)
-- ============================================================

-- Q1: What is the total loan portfolio value (sum of principal_kes) per branch_id?
--     Order by total descending.
select sum(principal_kes) as total_portfolio_value from loans
group by branch_id
order by total_portfolio_value desc;
-- Q2: How many loans exist per loan_type?
select count(*) from loans
group by loan_type;
-- Q3: What is the average loan size (principal_kes) per customer_segment?
--     Hint: You'll need to JOIN loans and customers.
select avg(loans.principal_kes),customers.customer_segment from loans
inner join customers on loans.customer_id = customers.customer_id
group by customers.customer_segment;

-- Q4: Which branch has the most Defaulted loans? Show branch_id and count.
select branches.branch_id,
       count(*) as defaulted_count
from branches
join loans on branches.branch_id = loans.branch_id
where loans.status in ("defaulted")
group by branches.branch_id
order by defaulted_count DESC
limit 1;


-- Q5: Find all loan officers whose combined loan portfolio exceeds KES 500,000.
--     Show officer_id and total_portfolio.
--     Hint: Use HAVING.
select  officer_id,
       sum(principal_kes) as total_portfolio
from loans
group by officer_id
having sum(principal_kes) > 500000;
-- Q6: What is the total amount repaid per payment_method?
select sum(amount_paid_kes),payment_method from repayments
group by payment_method;
-- Q7: How many customers exist per county? Order by count descending.
select count(*) as customer_population,county from customers
group by county
order by customer_population desc;

-- ============================================================
-- DAY 4 — JOINs (INNER JOIN, LEFT JOIN)
-- ============================================================

-- Q1: Show each loan with the borrowing customer's full_name and county.
--     Display: loan_id, full_name, county, principal_kes, status.
select 
    loans.loan_id,
    customers.full_name,
    customers.county,
    loans.principal_kes,
    loans.status
from loans
inner join customers on loans.customer_id = customers.customer_id;

-- Q2: List all loans alongside the officer who approved them.
--     Display: loan_id, loan_type, principal_kes, officer full_name.
SELECT
     loans.loan_id,
     loans.loan_type,
     loans.principal_kes,
     loan_officers.full_name
from loans
left join loan_officers on loans.officer_id = loan_officers.officer_id;
-- Q3: Show each loan with both the customer name AND the branch name.
--     Display: loan_id, customer full_name, branch_name, principal_kes.
select 
     l.loan_id,
     c.full_name,
     b.branch_name,
     l.principal_kes
from loans l
left join branches b
  on l.branch_id = b.branch_id
left join customers c 
  on l.customer_id = c.customer_id;
-- Q4: Find all customers who have more than one loan.
--     Display: customer_id, full_name, loan_count.
SELECT
     c.customer_id,
     c.full_name,
     count(l.loan_id) as loan_count
from customers c
left join loans l
  on c.customer_id = l.customer_id
group by c.customer_id,c.full_name
having count(l.loan_id)> 1;
-- Q5: List all loan officers and how many loans each has approved.
--     Include officers with zero loans (Hint: LEFT JOIN).
--     Display: full_name, loan_count. Order by loan_count descending.
SELECT
    lo.full_name,
    count(l.loan_id)as loan_count
from loan_officers lo 
left join loans l on lo.officer_id = l.officer_id
group by lo.full_name
order by count(l.loan_id) desc;
-- Q6: Show all repayments with the customer name attached.
--     Display: repayment_id, customer full_name, amount_paid_kes, payment_date.
SELECT
    r.repayment_id,
    c.full_name,
    r.amount_paid_kes,
    r.payment_date
from repayments r
left join loans l 
  on r.loan_id = l.loan_id
left join customers c 
  on l.customer_id = c.customer_id;


- - ============================================================
-- DAY 5 — MULTI-TABLE JOINs (3+ tables)
-- ============================================================

-- Q1: Write a full loan report joining all relevant tables.
--     Display: loan_id, customer full_name, officer full_name,
--              branch_name, principal_kes, loan_type, status.
select
     l.loan_id,
     c.full_name,
     lo.full_name,
     b.branch_name,
     l.principal_kes,
     l.loan_type,
     l.STATUS
from loans l 
left join customers c 
  on l.customer_id = c.customer_id
left join branches b 
 on l.branch_id = b.branch_id
left join loan_officers lo 
 on l.officer_id = lo.officer_id;
-- Q2: Show each repayment with the customer name, branch name,
--     and the officer who recorded it.
--     Display: repayment_id, customer full_name, branch_name,
--              recorded_by officer name, amount_paid_kes.
SELECT
 c.full_name,
 r.repayment_id,
 b.branch_name,
 (lo.full_name) as recorded_by,
 r.amount_paid_kes
from repayments r 
left join  loans l on r.loan_id = l.loan_id
left join customers c on l.customer_id = c.customer_id
left join loan_officers lo on l.officer_id = lo.officer_id
left join branches b on  l.branch_id = b.branch_id;
-- Q3: Find all defaulted loans — show the customer name, their county,
--     the branch where the loan was issued, and the approving officer.
select 
   c.full_name,
   c.county,
   b.branch_name,
   (lo.full_name) as approving_officer
from loans l 
left join customers c on l.customer_id = c.customer_id
left join branches b on l.branch_id = b.branch_id
left join loan_officers lo on l.officer_id = lo.officer_id
where status in ("defaulted");

-- Q4: Which region (from branches table) has the highest total loan portfolio?
--     Display: region, total_principal_kes. Order descending.
SELECT 
  b.region,
  sum(l.principal_kes) as total_loan_portfolio
from branches b 
left join loans l on b.branch_id = l.branch_id
group by b.region
order by total_loan_portfolio DESC
limit 1;

-- Q5: Show a full officer performance summary:
--     officer full_name, branch_name, number of loans approved,
--     total portfolio value.
--     Order by total portfolio value descending.
SELECT
     lo.full_name,
     b.branch_name,
     count(l.loan_id) as number_of_loans_approved,
     sum(l.principal_kes) as total_portfolio_value
from loan_officers lo 
left join branches b on lo.branch_id = b.branch_id
left join loans l on lo.officer_id = l.officer_id
group by lo.full_name,b.branch_name,l.loan_id
order by total_portfolio_value desc;

-- ============================================================
-- DAY 6 — CASE WHEN (conditional logic)
-- ============================================================

-- Q1: Classify each loan by risk level based on principal_kes:
--     - Below KES 100,000       → 'Low Risk'
--     - KES 100,000 to 500,000  → 'Medium Risk'
--     - Above KES 500,000       → 'High Risk'
--     Display: loan_id, principal_kes, risk_level.
select 
     loan_id,
     principal_kes,
     case 
         when principal_kes<100000 then 'low risk'
         when principal_kes between 100000 and 500000 then 'medium risk'
         when principal_kes >500000 then 'high risk'
         else 0
     end as risk_level
from loans;
-- Q2: Add a column called loan_health based on status:
--     - 'Active' or 'Closed'    → 'Performing'
--     - 'Defaulted'             → 'Non-Performing'
--     - 'Restructured'          → 'Watch List'
--     Display: loan_id, status, loan_health.
SELECT
    loan_id,
    status,
    case 
       when status in ("active","closed") then 'performing'
       when status in ("defaulted") then 'non-performing'
       when status in ("restructured") then 'watch list'
       else 'null'
    end as loan_health
from loans;

-- Q3: Flag each loan officer as meeting or missing their target:
--     Join loans to loan_officers, sum their portfolio,
--     and label as 'Target Met' or 'Below Target'.
--     Display: full_name, target_portfolio_kes, actual_portfolio, performance.
select 
     lo.full_name,
     lo.target_portfolio_kes,
     COALESCE(sum(l.principal_kes),0) as actual_portfolio,
     CASE 
      WHEN lo.target_portfolio_kes<COALESCE(sum(l.principal_kes),0) THEN 'target_met'
      when lo.target_portfolio_kes>COALESCE(sum(l.principal_kes),0) then 'below_target' 
      ELSE  'no_target'
     END as performance
from loan_officers lo 
left join loans l on lo.officer_id = l.officer_id
group by lo.full_name,lo.officer_id,lo.target_portfolio_kes;
-- Q4: Categorise customers by how long they've been with the bank
--     based on date_joined:
--     - Joined before 2018      → 'Loyal Customer'
--     - Joined 2018 to 2021     → 'Established Customer'
--     - Joined after 2021       → 'New Customer'
--     Display: full_name, date_joined, customer_category.
SELECT
     full_name,
     date_joined,
     CASE 
      WHEN date_joined<'2018-01-01' THEN  'loyal customer'
      when date_joined between '2018-01-01' and '2021-12-31' then 'established customer'
      when date_joined >'2021-12-31' then 'new customer'
      ELSE  0
     END as customer_category
from customers;
-- Q5: For each repayment, classify the payment size:
--     - Below KES 10,000        → 'Small Payment'
--     - KES 10,000 to 50,000    → 'Medium Payment'
--     - Above KES 50,000        → 'Large Payment'
--     Display: repayment_id, amount_paid_kes, payment_size.
SELECT
    repayment_id,
    amount_paid_kes,
    CASE 
      WHEN amount_paid_kes<10000 THEN 'small payment'
      when amount_paid_kes between 10000 and 50000 then 'medium payment'
      when amount_paid_kes > 50000 then 'large payment' 
      ELSE  'no_payment'
    END as payment_size
from repayments;

-- ============================================================
-- DAY 7 — SUBQUERIES
-- ============================================================

-- Q1: Find all customers whose total borrowed amount (sum of principal_kes)
--     is above the average loan size across all loans.
--     Display: customer_id, full_name, total_borrowed
SELECT
   c.customer_id,
   c.full_name,
   sum(l.principal_kes) as total_borrowed_amount
from customers c
join loans l on c.customer_id = l.loan_id
group by c.customer_id,c.full_name
having total_borrowed_amount>(
  select avg(principal_kes)
  from loans
);
-- Q2: Find all loan officers whose total approved portfolio
--     exceeds their individual target_portfolio_kes.
--     Display: full_name, target_portfolio_kes, actual_portfolio.
SELECT
    lo.full_name,
    lo.target_portfolio_kes,
    p.actual_portfolio
FROM loan_officers lo
JOIN (
    SELECT
        officer_id,
        SUM(principal_kes) AS actual_portfolio
    FROM loans
    GROUP BY officer_id
) p
    ON lo.officer_id = p.officer_id
WHERE p.actual_portfolio > lo.target_portfolio_kes;

-- Q3: Show all loans where the principal_kes is higher than
--     the average principal for that specific loan_type.
--     Display: loan_id, loan_type, principal_kes, avg_for_type.
SELECT
    l.loan_id,
    l.loan_type,
    l.principal_kes,
    (
        SELECT AVG(l2.principal_kes)
        FROM loans l2
        WHERE l2.loan_type = l.loan_type
    ) AS avg_for_type
FROM loans l
WHERE l.principal_kes > (
    SELECT AVG(l2.principal_kes)
    FROM loans l2
    WHERE l2.loan_type = l.loan_type
);

-- Q4: Find the branch with the single highest total loan portfolio.
--     Return only one row: branch_name, total_portfolio.
--     Hint: Use a subquery in WHERE or ORDER BY + LIMIT.
SELECT
    b.branch_name,
    SUM(l.principal_kes) AS total_portfolio
FROM branches b
JOIN loans l
    ON b.branch_id = l.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_portfolio DESC
LIMIT 1;

-- Q5: List all customers who have at least one Defaulted loan.
--     Display: customer_id, full_name.
--     Hint: Use EXISTS or IN with a subquery.
SELECT
    c.customer_id,
    c.full_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
      AND l.status = 'Defaulted'
);

-- Q6: Find loans where no repayment has ever been made.
--     Display: loan_id, customer_id, principal_kes, status.
--     Hint: Use NOT EXISTS or NOT IN.
SELECT
    l.loan_id,
    l.customer_id,
    l.principal_kes,
    l.status
FROM loans l
WHERE NOT EXISTS (
    SELECT 1
    FROM repayments r
    WHERE r.loan_id = l.loan_id
);


-- ============================================================
-- DAY 8 — WINDOW FUNCTIONS
-- ============================================================

-- Q1: Rank loan officers within each branch by their total loans disbursed.
--     Display: full_name, branch_id, total_loans, rank_in_branch.
--     Hint: Use RANK() OVER (PARTITION BY branch_id ORDER BY ...)
select 
      lo.full_name,
      lo.branch_id,
      COALESCE(sum(l.principal_kes),0) as total_loans,
      rank() over (PARTITION BY lo.branch_id order by COALESCE(sum(l.principal_kes),0)  desc) as rank_in_branch
from loan_officers lo 
left join loans l on lo.officer_id = l.officer_id
group by lo.full_name,lo.branch_id,lo.officer_id;

-- Q2: Show a running total (cumulative sum) of amount_paid_kes per loan,
--     ordered by payment_date.
--     Display: repayment_id, loan_id, payment_date, amount_paid_kes, cumulative_paid.
--     Hint: Use SUM() OVER (PARTITION BY loan_id ORDER BY payment_date)
SELECT
     repayment_id,
     loan_id,
     payment_date,
     amount_paid_kes,
     (sum(amount_paid_kes) over(PARTITION BY loan_id order by payment_date)) as cumulative_paid
from repayments;
-- Q3: For each loan, show each repayment amount as a percentage
--     of the total repaid for that loan.
--     Display: repayment_id, loan_id, amount_paid_kes, pct_of_loan_repayments.
SELECT
     r.repayment_id,
     r.loan_id,
     r.amount_paid_kes,
     round(
        r.amount_paid_kes*100/sum(r.amount_paid_kes) over (PARTITION BY r.loan_id),
        2
     )
from repayments r;
-- Q4: Show each loan's principal_kes alongside the average principal
--     for its loan_type, and the difference between the two.
--     Display: loan_id, loan_type, principal_kes, avg_for_type, difference.
--     Hint: Use AVG() OVER (PARTITION BY loan_type)
select loan_id,
       loan_type,
       principal_kes,
       avg(principal_kes) over(PARTITION BY loan_type) as avg_for_type,
       (principal_kes-(avg(principal_kes) over(PARTITION BY loan_type))) as difference
from loans;
-- Q5: Number the repayments for each loan chronologically (1st payment, 2nd, 3rd...).
--     Display: repayment_id, loan_id, payment_date, payment_number.
--     Hint: Use ROW_NUMBER() OVER (PARTITION BY loan_id ORDER BY payment_date)
SELECT
      repayment_id,
      loan_id,
      payment_date,
      ROW_NUMBER() over (PARTITION BY loan_id order by payment_date)
from repayments;

-- ============================================================
-- DAY 9 — CTEs (Common Table Expressions)
-- ============================================================

-- Q1: Write a CTE called outstanding_balances that calculates
--     the outstanding balance per loan (principal_kes minus total amount repaid).
--     Then query the CTE to show all loans where more than 30% is still unpaid.
--     Display: loan_id, principal_kes, total_repaid, outstanding, pct_unpaid.
WITH outstanding_balances as (
    select l.loan_id,
           l.principal_kes,
           COALESCE(sum(r.amount_paid_kes),0) as total_repaid,
           (l.principal_kes-COALESCE(sum(r.amount_paid_kes),0)) as outstanding_balances,
           ((l.principal_kes - COALESCE(SUM(r.amount_paid_kes), 0)) * 100.0 / l.principal_kes) AS pct_unpaid
    from loans l
    left join repayments r on l.loan_id=r.loan_id
    group by l.loan_id,l.principal_kes
)
select loan_id,
       principal_kes,
       total_repaid,
       outstanding_balances,
       pct_unpaid
from outstanding_balances
where pct_unpaid>30;


-- Q2: Write a CTE called branch_summary that calculates per branch:
--     total loans, total portfolio value, total repayments received.
--     Then query it to show only branches where repayments cover
--     less than 50% of the portfolio.
WITH loan_repayments AS (
    SELECT
        loan_id,
        SUM(amount_paid_kes) AS total_repaid
    FROM repayments
    GROUP BY loan_id
),
branch_summary AS (
    SELECT
        b.branch_id,
        b.branch_name,
        COUNT(l.loan_id) AS total_loans,
        COALESCE(SUM(l.principal_kes), 0) AS total_portfolio_value,
        COALESCE(SUM(lr.total_repaid), 0) AS total_repayments_received,
        COALESCE(SUM(lr.total_repaid), 0) * 100.0
            / NULLIF(SUM(l.principal_kes), 0) AS repayment_cover
    FROM branches b
    LEFT JOIN loans l
        ON b.branch_id = l.branch_id
    LEFT JOIN loan_repayments lr
        ON l.loan_id = lr.loan_id
    GROUP BY b.branch_id, b.branch_name
)
SELECT
    branch_id,
    branch_name,
    total_loans,
    total_portfolio_value,
    total_repayments_received,
    ROUND(repayment_cover, 2) AS repayment_cover
FROM branch_summary
WHERE repayment_cover < 50;

-- Q3: Use two CTEs:
--     - First CTE: total amount disbursed per officer
--     - Second CTE: total amount repaid per officer (via loans → repayments)
--     Final query: show officer name, disbursed, repaid, and collection_rate (%).
with disbursed as (
    select  l.officer_id,
           COALESCE(sum(l.principal_kes),0) as total_disbursed
    from loans l
    group by l.officer_id
),
amount_repaid as (
    select 
         COALESCE(sum(r.amount_repaid_kes),0) as total_repaid
    from loans l
    left join repayments r  on l.loan_id= r.loan_id
    group by l.officer_id
)
select lo.full_name as officer_name,
       COALESCE(d.total_disbursed,0) as disbursed,
       COALESCE(ar.total_repaid,0) as repaid,
       round(
        COALESCE(ar.total_repaid,0)*100/
         nullif(COALESCE(d.total_disbursed,0),0),
         2
       )as collection_rate
from loan_officers lo
left join disbursed d on lo.officer_id = d.officer_id
left join repaid r on lo.officer_id = r.officer_id;
-- Q4: Write a CTE that finds the top performing branch by total repayments,
--     then join back to the loans table to list all loans in that branch.
with branch_repayments as (
    select 
          l.branch_id,
          b.branch_name,
          COALESCE(sum(r.amount_paid_kes),0) as total_repayments
    from branches b 
     left join loans l on b.branch_id = l.branch_id
    left join repayments r on l.loan_id = r.loan_id
    group by l.branch_id,b.branch_name
),
top_performing as (
 select branch_id,
       branch_name,
       total_repayments
from branch_repayments
order by total_repayments DESC
limit 1
)
select 
   tp.branch_id,
   tp.branch_name,
   tp.total_repayments,
   l.loan_id
from top_performing tp 
join loans l on tp.branch_id = l.loan_id
order by l.loan_id;
       

-- Q5: Using a CTE, identify customers with more than one loan,
--     then show all their loans with status and principal.
with customer_loans as(
    select c.customer_id,
           c.full_name,
           count(l.loan_id) as loan_count
    from customers c 
    join loans l on c.customer_id = l.customer_id
    group by c.customer_id,c.full_name
    having count(loan_id)>1
)
select cl.customer_id,
       cl.full_name,
       l.loan_id,
       l.loan_type,
       l.status,
       l.principal_kes
from customer_loans cl
join loans l on cl.customer_id = l.customer_id
order by cl.customer_id,l.customer_id;


-- ============================================================
-- DAY 10 — CAPSTONE QUERY (Everything combined)
-- ============================================================

-- Write a single comprehensive query that produces a LOAN HEALTH REPORT.
-- Use CTEs, JOINs, CASE WHEN, and window functions together.
--
-- The report must include these columns:
--   1. loan_id
--   2. customer_name         (from customers)
--   3. branch_name           (from branches)
--   4. officer_name          (from loan_officers)
--   5. loan_type
--   6. principal_kes
--   7. total_repaid          (sum of all repayments for that loan)
--   8. outstanding_balance   (principal minus total_repaid)
--   9. repayment_rate        (total_repaid / principal * 100, rounded to 2dp)
--  10. days_since_disbursement (use DATEDIFF from disbursement_date to today)
--  11. loan_status           (from loans.status)
--  12. risk_classification   (your own CASE WHEN logic combining status + repayment_rate)
--  13. portfolio_rank        (rank each loan by principal_kes descending using a window function)
--
-- Order the final result by outstanding_balance descending.
--
-- This query is your SQL portfolio piece. Take your time. Think it through.
-- Break it into CTEs first before writing the final SELECT.

-- ============================================================
-- END OF PRACTICE FILE
-- Good luck. You've got this.
-- ============================================================
