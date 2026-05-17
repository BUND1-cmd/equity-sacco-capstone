-- ============================================================
-- EQUITY SACCO KENYA LTD — DATA INSERTS
-- Database: equity_sacco_db
-- ============================================================

USE equity_sacco_db;

-- ============================================================
-- INSERT: members (20 members)
-- ============================================================
INSERT INTO members (full_name, national_id, phone, email, county, occupation, membership_type, share_capital_contribution, join_date, status) VALUES
('James Kamau Njoroge',      '12345678', '0712345678', 'james.kamau@gmail.com',      'Nairobi',     'Teacher',           'individual', 50000.00,  '2018-03-01', 'active'),
('Faith Wanjiku Mwangi',     '23456789', '0723456789', 'faith.wanjiku@gmail.com',    'Kiambu',      'Nurse',             'individual', 30000.00,  '2019-06-15', 'active'),
('Brian Odhiambo Otieno',    '34567890', '0734567890', 'brian.odhiambo@gmail.com',   'Kisumu',      'Engineer',          'individual', 75000.00,  '2017-01-10', 'active'),
('Aisha Mohamed Hassan',     '45678901', '0745678901', 'aisha.mohamed@gmail.com',    'Mombasa',     'Accountant',        'individual', 40000.00,  '2020-09-20', 'active'),
('Kevin Mutua Kioko',        '56789012', '0756789012', 'kevin.mutua@gmail.com',      'Machakos',    'Farmer',            'individual', 20000.00,  '2021-02-28', 'active'),
('Grace Adhiambo Ouma',      '67890123', '0767890123', 'grace.adhiambo@gmail.com',   'Siaya',       'Business Owner',    'individual', 60000.00,  '2018-07-05', 'active'),
('Dennis Kipchoge Ruto',     '78901234', '0778901234', 'dennis.kipchoge@gmail.com',  'Uasin Gishu', 'Lawyer',            'individual', 90000.00,  '2016-11-22', 'active'),
('Mercy Chebet Sang',        '89012345', '0789012345', 'mercy.chebet@gmail.com',     'Kericho',     'Doctor',            'individual', 80000.00,  '2017-04-18', 'active'),
('Samuel Kariuki Mwenda',    '90123456', '0790123456', 'samuel.kariuki@gmail.com',   'Nyeri',       'Police Officer',    'individual', 25000.00,  '2019-11-30', 'active'),
('Lilian Awuor Oloo',        '01234567', '0701234567', 'lilian.awuor@gmail.com',     'Homa Bay',    'Teacher',           'individual', 35000.00,  '2020-03-14', 'active'),
('Peter Njoroge Maina',      '11223344', '0711223344', 'peter.njoroge@gmail.com',    'Nairobi',     'IT Specialist',     'individual', 55000.00,  '2018-08-09', 'active'),
('Mary Nyambura Gitau',      '22334455', '0722334455', 'mary.nyambura@gmail.com',    'Muranga',     'Nurse',             'individual', 30000.00,  '2021-05-17', 'active'),
('Hassan Abdi Omar',         '33445566', '0733445566', 'hassan.abdi@gmail.com',      'Garissa',     'Business Owner',    'individual', 45000.00,  '2019-01-08', 'active'),
('Agnes Cherotich Korir',    '44556677', '0744556677', 'agnes.cherotich@gmail.com',  'Nandi',       'Farmer',            'individual', 15000.00,  '2022-07-21', 'dormant'),
('Paul Mwenda Gitonga',      '55667788', '0755667788', 'paul.mwenda@gmail.com',      'Meru',        'Accountant',        'individual', 50000.00,  '2018-12-03', 'active'),
('Esther Akinyi Onyango',    '66778899', '0766778899', 'esther.akinyi@gmail.com',    'Kisumu',      'Lecturer',          'individual', 70000.00,  '2017-09-25', 'active'),
('John Maina Kariuki',       '77889900', '0777889900', 'john.maina@gmail.com',       'Nairobi',     'Engineer',          'individual', 85000.00,  '2016-05-14', 'active'),
('Fatuma Hassan Ali',        '88990011', '0788990011', 'fatuma.hassan@gmail.com',    'Mombasa',     'Business Owner',    'corporate',  150000.00, '2015-10-01', 'active'),
('David Kipchoge Bett',      '99001122', '0799001122', 'david.kipchoge@gmail.com',   'Bomet',       'Farmer',            'individual', 20000.00,  '2022-01-19', 'active'),
('Rose Wambui Njoroge',      '00112233', '0700112233', 'rose.wambui@gmail.com',      'Kiambu',      'Teacher',           'individual', 40000.00,  '2020-06-30', 'active');


-- ============================================================
-- INSERT: accounts (20 accounts, one per member)
-- ============================================================
INSERT INTO accounts (member_id, account_number, account_type, balance_ke, date_opened, status) VALUES
(1,  'ESK001001', 'savings',       185000.00, '2018-03-01', 'active'),
(2,  'ESK001002', 'savings',       92000.00,  '2019-06-15', 'active'),
(3,  'ESK001003', 'fixed deposit', 450000.00, '2017-01-10', 'active'),
(4,  'ESK001004', 'savings',       67000.00,  '2020-09-20', 'active'),
(5,  'ESK001005', 'savings',       23000.00,  '2021-02-28', 'active'),
(6,  'ESK001006', 'shares',        310000.00, '2018-07-05', 'active'),
(7,  'ESK001007', 'fixed deposit', 620000.00, '2016-11-22', 'active'),
(8,  'ESK001008', 'savings',       275000.00, '2017-04-18', 'active'),
(9,  'ESK001009', 'savings',       48000.00,  '2019-11-30', 'active'),
(10, 'ESK001010', 'savings',       71000.00,  '2020-03-14', 'active'),
(11, 'ESK001011', 'shares',        195000.00, '2018-08-09', 'active'),
(12, 'ESK001012', 'savings',       34000.00,  '2021-05-17', 'active'),
(13, 'ESK001013', 'savings',       88000.00,  '2019-01-08', 'active'),
(14, 'ESK001014', 'savings',       12000.00,  '2022-07-21', 'dormant'),
(15, 'ESK001015', 'savings',       156000.00, '2018-12-03', 'active'),
(16, 'ESK001016', 'fixed deposit', 380000.00, '2017-09-25', 'active'),
(17, 'ESK001017', 'shares',        520000.00, '2016-05-14', 'active'),
(18, 'ESK001018', 'fixed deposit', 890000.00, '2015-10-01', 'active'),
(19, 'ESK001019', 'savings',       18000.00,  '2022-01-19', 'active'),
(20, 'ESK001020', 'savings',       95000.00,  '2020-06-30', 'active');


-- ============================================================
-- INSERT: transactions (40 transactions)
-- ============================================================
INSERT INTO transactions (account_id, transaction_type, amount_kes, transaction_date, description, reference_no, channel, processed_by) VALUES
(1,  'deposit',    20000.00,  '2024-01-05', 'Monthly savings deposit',        'TXN240105001', 'm-pesa',        15),
(1,  'deposit',    20000.00,  '2024-02-05', 'Monthly savings deposit',        'TXN240205001', 'm-pesa',        15),
(1,  'withdrawal', 15000.00,  '2024-02-20', 'School fees withdrawal',         'TXN240220001', 'cash',          15),
(2,  'deposit',    10000.00,  '2024-01-10', 'Monthly savings deposit',        'TXN240110001', 'm-pesa',        15),
(2,  'deposit',    10000.00,  '2024-02-10', 'Monthly savings deposit',        'TXN240210001', 'm-pesa',        15),
(3,  'deposit',    50000.00,  '2024-01-15', 'Fixed deposit top up',           'TXN240115001', 'bank transfer', 15),
(3,  'deposit',    50000.00,  '2024-03-15', 'Fixed deposit top up',           'TXN240315001', 'bank transfer', 15),
(4,  'deposit',    8000.00,   '2024-01-20', 'Monthly savings deposit',        'TXN240120001', 'm-pesa',        15),
(4,  'withdrawal', 5000.00,   '2024-02-25', 'Personal withdrawal',            'TXN240225001', 'cash',          15),
(5,  'deposit',    3000.00,   '2024-01-25', 'Monthly savings deposit',        'TXN240125001', 'm-pesa',        15),
(6,  'deposit',    30000.00,  '2024-01-08', 'Shares top up',                  'TXN240108001', 'bank transfer', 15),
(6,  'deposit',    30000.00,  '2024-03-08', 'Shares top up',                  'TXN240308001', 'bank transfer', 15),
(7,  'deposit',    100000.00, '2024-01-12', 'Fixed deposit top up',           'TXN240112001', 'bank transfer', 15),
(7,  'deposit',    100000.00, '2024-04-12', 'Fixed deposit top up',           'TXN240412001', 'bank transfer', 15),
(8,  'deposit',    25000.00,  '2024-01-18', 'Monthly savings deposit',        'TXN240118001', 'm-pesa',        15),
(8,  'withdrawal', 10000.00,  '2024-03-22', 'Medical expenses withdrawal',    'TXN240322001', 'cash',          15),
(9,  'deposit',    5000.00,   '2024-02-01', 'Monthly savings deposit',        'TXN240201001', 'm-pesa',        15),
(10, 'deposit',    7000.00,   '2024-01-28', 'Monthly savings deposit',        'TXN240128001', 'm-pesa',        15),
(10, 'deposit',    7000.00,   '2024-02-28', 'Monthly savings deposit',        'TXN240228001', 'm-pesa',        15),
(11, 'deposit',    20000.00,  '2024-01-30', 'Shares purchase',                'TXN240130001', 'bank transfer', 15),
(12, 'deposit',    4000.00,   '2024-02-14', 'Monthly savings deposit',        'TXN240214001', 'm-pesa',        15),
(13, 'deposit',    12000.00,  '2024-01-22', 'Monthly savings deposit',        'TXN240122001', 'm-pesa',        15),
(13, 'withdrawal', 8000.00,   '2024-03-10', 'Business expense withdrawal',    'TXN240310001', 'cash',          15),
(15, 'deposit',    15000.00,  '2024-02-08', 'Monthly savings deposit',        'TXN240208001', 'm-pesa',        15),
(15, 'deposit',    15000.00,  '2024-03-08', 'Monthly savings deposit',        'TXN240308002', 'm-pesa',        15),
(16, 'deposit',    40000.00,  '2024-01-16', 'Fixed deposit top up',           'TXN240116001', 'bank transfer', 15),
(17, 'deposit',    60000.00,  '2024-02-16', 'Shares top up',                  'TXN240216001', 'bank transfer', 15),
(18, 'deposit',    200000.00, '2024-01-03', 'Corporate fixed deposit top up', 'TXN240103001', 'bank transfer', 15),
(18, 'deposit',    200000.00, '2024-04-03', 'Corporate fixed deposit top up', 'TXN240403001', 'bank transfer', 15),
(18, 'withdrawal', 50000.00,  '2024-03-20', 'Business operations withdrawal', 'TXN240320001', 'cheque',        15),
(19, 'deposit',    3000.00,   '2024-02-19', 'Monthly savings deposit',        'TXN240219001', 'm-pesa',        15),
(20, 'deposit',    10000.00,  '2024-01-26', 'Monthly savings deposit',        'TXN240126001', 'm-pesa',        15),
(20, 'deposit',    10000.00,  '2024-02-26', 'Monthly savings deposit',        'TXN240226001', 'm-pesa',        15),
(1,  'deposit',    20000.00,  '2024-03-05', 'Monthly savings deposit',        'TXN240305001', 'm-pesa',        15),
(2,  'deposit',    10000.00,  '2024-03-10', 'Monthly savings deposit',        'TXN240310002', 'm-pesa',        15),
(8,  'deposit',    25000.00,  '2024-04-18', 'Monthly savings deposit',        'TXN240418001', 'm-pesa',        15),
(9,  'deposit',    5000.00,   '2024-03-01', 'Monthly savings deposit',        'TXN240301001', 'm-pesa',        15),
(11, 'deposit',    20000.00,  '2024-03-30', 'Shares purchase',                'TXN240330001', 'bank transfer', 15),
-- Flagged large transactions for audit
(7,  'withdrawal', 500000.00, '2024-04-01', 'Large withdrawal - pending review', 'TXN240401001', 'bank transfer', 17),
(18, 'withdrawal', 600000.00, '2024-04-15', 'Large corporate withdrawal',        'TXN240415001', 'cheque',        17);


-- ============================================================
-- INSERT: loans (15 loans)
-- ============================================================
INSERT INTO loans (member_id, loan_type, principal_kes, interest_rate, disbursement_date, due_date, status, guarantor_id) VALUES
(1,  'development',   500000.00,  14.00, '2022-03-01', '2025-03-01', 'active',      3),
(2,  'emergency',     80000.00,   16.00, '2023-07-15', '2024-07-15', 'active',      1),
(3,  'business',      1200000.00, 15.00, '2021-06-01', '2024-06-01', 'defaulted',   7),
(4,  'school fees',   150000.00,  14.00, '2023-01-10', '2024-01-10', 'closed',      2),
(5,  'emergency',     40000.00,   16.00, '2023-09-20', '2024-09-20', 'active',      1),
(6,  'development',   800000.00,  14.00, '2022-08-05', '2025-08-05', 'active',      8),
(7,  'asset finance', 2000000.00, 17.00, '2021-11-22', '2026-11-22', 'active',      17),
(8,  'business',      600000.00,  15.00, '2022-04-18', '2025-04-18', 'active',      16),
(9,  'school fees',   60000.00,   14.00, '2023-11-30', '2024-11-30', 'active',      2),
(10, 'emergency',     50000.00,   16.00, '2024-01-14', '2025-01-14', 'active',      1),
(11, 'development',   400000.00,  14.00, '2022-09-09', '2025-09-09', 'restructured',3),
(13, 'business',      350000.00,  15.00, '2023-02-08', '2025-02-08', 'active',      15),
(15, 'development',   700000.00,  14.00, '2022-01-03', '2025-01-03', 'active',      17),
(17, 'asset finance', 1800000.00, 17.00, '2021-05-14', '2026-05-14', 'active',      7),
(18, 'business',      3000000.00, 15.00, '2020-10-01', '2025-10-01', 'active',      3);


-- ============================================================
-- INSERT: repayments (35 repayments)
-- ============================================================
INSERT INTO repayments (loan_id, payment_date, amount_paid_kes, payment_method, mpesa_ref, processed_by) VALUES
(1,  '2022-04-01', 20000.00,  'm-pesa',           'QAB3X7K9M', 15),
(1,  '2022-05-01', 20000.00,  'm-pesa',           'RBC4Y8L0N', 15),
(1,  '2022-06-01', 20000.00,  'm-pesa',           'SCD5Z9M1O', 15),
(1,  '2022-07-01', 20000.00,  'salary deduction', NULL,        15),
(1,  '2022-08-01', 20000.00,  'salary deduction', NULL,        15),
(2,  '2023-08-15', 8000.00,   'm-pesa',           'TDE6A0N2P', 15),
(2,  '2023-09-15', 8000.00,   'm-pesa',           'UEF7B1O3Q', 15),
(2,  '2023-10-15', 8000.00,   'm-pesa',           'VFG8C2P4R', 15),
(3,  '2021-07-01', 50000.00,  'bank transfer',    NULL,        15),
(3,  '2021-08-01', 50000.00,  'bank transfer',    NULL,        15),
(4,  '2023-02-10', 15000.00,  'm-pesa',           'WGH9D3Q5S', 15),
(4,  '2023-04-10', 15000.00,  'm-pesa',           'XHI0E4R6T', 15),
(4,  '2023-06-10', 15000.00,  'm-pesa',           'YIJ1F5S7U', 15),
(4,  '2023-08-10', 15000.00,  'm-pesa',           'ZJK2G6T8V', 15),
(4,  '2023-10-10', 15000.00,  'm-pesa',           'AKL3H7U9W', 15),
(5,  '2023-10-20', 5000.00,   'm-pesa',           'BLM4I8V0X', 15),
(5,  '2023-11-20', 5000.00,   'm-pesa',           'CMN5J9W1Y', 15),
(6,  '2022-09-05', 30000.00,  'salary deduction', NULL,        15),
(6,  '2022-10-05', 30000.00,  'salary deduction', NULL,        15),
(6,  '2022-11-05', 30000.00,  'salary deduction', NULL,        15),
(7,  '2021-12-22', 80000.00,  'bank transfer',    NULL,        15),
(7,  '2022-01-22', 80000.00,  'bank transfer',    NULL,        15),
(7,  '2022-02-22', 80000.00,  'bank transfer',    NULL,        15),
(8,  '2022-05-18', 25000.00,  'bank transfer',    NULL,        15),
(8,  '2022-06-18', 25000.00,  'bank transfer',    NULL,        15),
(9,  '2023-12-30', 6000.00,   'm-pesa',           'DNO6K0X2Z', 15),
(10, '2024-02-14', 5000.00,   'm-pesa',           'EOP7L1Y3A', 15),
(10, '2024-03-14', 5000.00,   'm-pesa',           'FPQ8M2Z4B', 15),
(11, '2022-10-09', 15000.00,  'salary deduction', NULL,        15),
(11, '2022-11-09', 15000.00,  'salary deduction', NULL,        15),
(12, '2023-03-08', 20000.00,  'm-pesa',           'GQR9N3A5C', 15),
(12, '2023-05-08', 20000.00,  'm-pesa',           'HRS0O4B6D', 15),
(13, '2022-02-03', 30000.00,  'bank transfer',    NULL,        15),
(14, '2021-06-14', 70000.00,  'bank transfer',    NULL,        15),
(15, '2020-11-01', 100000.00, 'bank transfer',    NULL,        15);


-- ============================================================
-- INSERT: income_expenditure (24 monthly entries for 2024)
-- ============================================================
INSERT INTO income_expenditure (entry_date, entry_type, category, amount_kes, description, recorded_by) VALUES
-- January 2024
('2024-01-31', 'income',      'Interest Income',     620000.00, 'Monthly loan interest collected',      15),
('2024-01-31', 'income',      'Membership Fees',     45000.00,  'New member registration fees',         15),
('2024-01-31', 'expenditure', 'Staff Salaries',      380000.00, 'January staff salaries',               15),
('2024-01-31', 'expenditure', 'Rent',                85000.00,  'Office rent - Nairobi CBD',            15),
('2024-01-31', 'expenditure', 'Utilities',           22000.00,  'Electricity and water bills',          15),
-- February 2024
('2024-02-29', 'income',      'Interest Income',     635000.00, 'Monthly loan interest collected',      15),
('2024-02-29', 'income',      'Membership Fees',     30000.00,  'New member registration fees',         15),
('2024-02-29', 'expenditure', 'Staff Salaries',      380000.00, 'February staff salaries',              15),
('2024-02-29', 'expenditure', 'Rent',                85000.00,  'Office rent - Nairobi CBD',            15),
('2024-02-29', 'expenditure', 'Marketing',           40000.00,  'Member recruitment campaign',          15),
-- March 2024
('2024-03-31', 'income',      'Interest Income',     648000.00, 'Monthly loan interest collected',      15),
('2024-03-31', 'income',      'Membership Fees',     60000.00,  'New member registration fees',         15),
('2024-03-31', 'expenditure', 'Staff Salaries',      380000.00, 'March staff salaries',                 15),
('2024-03-31', 'expenditure', 'Rent',                85000.00,  'Office rent - Nairobi CBD',            15),
('2024-03-31', 'expenditure', 'Utilities',           19000.00,  'Electricity and water bills',          15),
-- April 2024
('2024-04-30', 'income',      'Interest Income',     660000.00, 'Monthly loan interest collected',      15),
('2024-04-30', 'income',      'Membership Fees',     25000.00,  'New member registration fees',         15),
('2024-04-30', 'expenditure', 'Staff Salaries',      395000.00, 'April staff salaries - increment',     15),
('2024-04-30', 'expenditure', 'Rent',                85000.00,  'Office rent - Nairobi CBD',            15),
('2024-04-30', 'expenditure', 'Audit Fees',          120000.00, 'Annual external audit fees',           15),
('2024-04-30', 'expenditure', 'Utilities',           24000.00,  'Electricity and water bills',          15),
('2024-04-30', 'expenditure', 'Marketing',           35000.00,  'Member recruitment campaign',          15),
('2024-04-30', 'income',      'Penalties & Fines',   18000.00,  'Late repayment penalties collected',   15),
('2024-04-30', 'income',      'Investment Income',   95000.00,  'Treasury bill returns',                15);


-- ============================================================
-- BUSINESS SQL QUESTIONS
-- ============================================================

-- Q1: What is the total asset base of the SACCO?
-- (Total deposits across all active accounts)
-- Hint: SUM balance_ke from accounts where status = 'active'

-- Q2: What is the total loan portfolio value?
-- Show total principal disbursed, broken down by loan_type.
-- Order by total descending.

-- Q3: What is the NPL (Non-Performing Loan) ratio?
-- NPL = (total principal of Defaulted loans / total principal of all loans) * 100
-- Hint: Use CASE WHEN inside SUM or two separate CALCULATE-style subqueries

-- Q4: Which members are behind on loan repayments?
-- Find all active loans where total repaid is less than 30% of principal.
-- Show: member full_name, loan_type, principal_kes, total_repaid, repayment_rate
-- Hint: JOIN loans → repayments → members, use GROUP BY and HAVING

-- Q5: What is our monthly income vs expenditure trend for 2024?
-- Show: month, total_income, total_expenditure, net_profit
-- Hint: Use CASE WHEN inside SUM with GROUP BY MONTH(entry_date)

-- Q6: Flag all transactions above KES 100,000 for audit review.
-- Show: transaction_id, account_number, member full_name, amount_kes,
--       transaction_date, channel, description
-- Order by amount_kes descending.

-- Q7: What is our loan-to-deposit ratio?
-- Formula: (Total loan portfolio / Total deposits) * 100
-- This is a liquidity indicator — above 80% is a warning sign for SACCOs
-- Hint: Use two subqueries

-- Q8: How is membership growing month by month?
-- Show: year, month, new_members that month, cumulative_total
-- Hint: Use COUNT with GROUP BY and a window function for cumulative total

-- ============================================================
-- END OF FILE
-- ============================================================
