# FitPro Gym - SQL Basics Project

![Project Image Placeholder](https://github.com/YashAnalyst47/Fitpro-Gym/blob/main/Fitpro_logo.png)

Welcome to my first SQL project, where I analyze real-time gym data from **FitPro Gym**! This project uses a dataset of **10,000 visit records** to explore and analyze gym membership and visit data, answering key business questions that can help a fitness center understand its customer base better and optimize its services.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Database Schema](#database-schema)
- [Business Problems](#business-problems)
- [SQL Queries & Analysis](#sql-queries--analysis)
- [Getting Started](#getting-started)
- [Questions & Feedback](#questions--feedback)
- [Contact Me](#contact-me)

---

## Introduction

This project aims to demonstrate essential SQL skills by analyzing a dataset from FitPro Gym. Using SQL, I explored membership details, member demographics, and visit patterns to derive actionable insights. This project showcases fundamental SQL techniques, including creating tables, writing queries, and analyzing data.

## Project Structure

1. **SQL Scripts**: Code to create the database schema and queries for analysis.
2. **Dataset**: Real-time data on gym visits, membership, and member demographics.
3. **Analysis**: SQL queries solving practical business problems, each one crafted to address specific questions.

---

## Database Schema

Here’s an overview of the database structure:

### 1. **Members Table**
- **member_id**: Unique identifier for each member
- **name**: Name of the member

### 2. **Memberships Table**
- **member_id**: Unique identifier linked to the `members` table
- **age**: Age of the member
- **gender**: Gender of the member ('M' or 'F')
- **membership_type**: Type of membership (e.g., Monthly, Quarterly)
- **join_date**: Date when the member joined
- **status**: Membership status (e.g., Active, Cancelled)

### 3. **Visits Table**
- **visit_id**: Unique identifier for each visit
- **member_id**: Linked to the `members` table
- **visit_date**: Date of the visit
- **check_in_time**: Check-in time of the visit
- **check_out_time**: Check-out time of the visit

``` SQL
-- Create database
CREATE DATABASE fitpro_db

-- Create members table
CREATE TABLE members (
    member_id INT PRIMARY KEY,
    name VARCHAR(100)
);

-- Create memberships table
CREATE TABLE memberships (
    member_id INT PRIMARY KEY,
    age INT,
    gender CHAR(1),
    membership_type VARCHAR(20),
    join_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- Create visits table
CREATE TABLE visits (
    visit_id INT PRIMARY KEY,
    member_id INT,
    visit_date DATE,
    check_in_time TIME,
    check_out_time TIME,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);
```

## Business Problems

The following queries were created to solve specific business questions. Each query is designed to provide insights based on gym membership and visit data.

1. Retrieve the **name** and **membership_type** of female members.
2. Find members who have a **Monthly membership** and joined after **2023-11-01**.
3. List members with a **Quarterly membership** aged between **20 and 30**.

Additional aggregations and grouping:

4. Count members by membership type (e.g., Monthly, Weekly, Quarterly)and arrange in ascending order.
5. Calculate the average age of members, grouped by membership type in descending order of age.
6. Ascertain the total visits for each visit date and list the top 10 days with maximum visits.

Advanced queries:
7. Top 3 members with the highest visits.
8. Members who joined in 2023, grouped by membership type (where each group has > 100 members).
9. Members with more than 2 visits, sorted by total visits, displaying the top 5. 
10. Active members grouped by membership type, sorted by total visits.


## SQL Queries & Analysis

The `analysis.sql` file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.

## Getting Started

### Prerequisites
- PostgreSQL (or any SQL-compatible database)
- Basic understanding of SQL

### Steps
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/YashAnalyst47/Fitpro-Gym
   ```
2. **Set Up the Database**:
   - Run the `FitPro_Schemas.sql` script to set up tables and insert sample data (check the attached CSV files).

3. **Run Queries**:
   - Execute each query in `analysis.sql` to explore and analyze the data.

---

## Questions & Feedback

If you have any questions or feedback, feel free to create an issue or reach out!
