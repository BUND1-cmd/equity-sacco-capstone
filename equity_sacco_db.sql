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
)