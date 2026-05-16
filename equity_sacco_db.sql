CREATE DATABASE IF NOT EXISTS equity_sacco_db;
USE equity_sacco_db;

create table members (
    member_id int AUTO_INCREMENT primary key,
    full_name varchar(100) not null,
    national_id varchar(20) unique not null,
    phone varchar(20) not null,
    email varchar(100) unique not null,
    county varchar(100) not null,
    occupation varchar(100) not null,
    membership_type enum ('individual','corporate') not null,
    share_capital_contribution decimal(15,2) not null,
    join_date date not null,
    status enum ('active','dormant','exited') not null
);

create table accounts (
    account_id int auto_increment primary key,
    member_id int not null,
    foreign key (member_id) references members(member_id),
    account_number varchar(20) unique not null,
    account_type enum ('savings','shares','fixed deposit'),
    balance_ke decimal(15,2) not null,
    date_opened date not null,
    status enum ('active','dormant','closed') not null
);

create table transactions(
    transaction_id int auto_increment primary key,
    account_id int not null,
    foreign key(account_id) references accounts(account_id),
    transaction_type enum ('deposit','withdrawal','transfer'),
    amount_kes decimal(15,2) not null,
    transaction_date date not null,
    description varchar(200) not null,
    reference_no varchar(20) unique not null,
    channel enum ('m-pesa','bank transfer','cash','cheque'),
    processed_by int,
    foreign key(processed_by) references members(member_id)
);

create table loans(
    loan_id int primary key auto_increment,
    member_id int not null,
    foreign key(member_id) references members(member_id),
    loan_type enum ('development','emergency','school fees','asset finance','business'),
    principal_kes decimal(15,2) not null,
    interest_rate decimal(15,2) not null,
    disbursement_date date not null,
    due_date date not null,
    status enum ('active','closed','defaulted','restructured'),
    guarantor_id int not null,
    foreign key (guarantor_id) references members(member_id)
);

create table repayments(
    repayment_id int AUTO_INCREMENT primary key,
    loan_id int,
    foreign key (loan_id) references loans(loan_id),
    payment_date date not null,
    amount_paid_kes decimal(15,2) not null,
    payment_method enum('m-pesa','bank transfer','cash','salary','deduction'),
    mpesa_ref varchar(20),
    processed_by int not null,
    foreign key (processed_by) references members(member_id)
);


create table income_expenditure( 
    entry_id int primary key AUTO_INCREMENT,
    entry_date date not null,
    entry_type enum ('income','expenditure'),
    category varchar(100),
    amount_kes decimal(15,2) not null,
    description varchar(200),
    recorded_by int,
    foreign key(recorded_by) references members(member_id)
);

