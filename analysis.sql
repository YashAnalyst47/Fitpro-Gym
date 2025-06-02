-- This file contains all SQL queries developed for this project. Each query corresponds to a business problem and demonstrates skills in SQL syntax, data filtering, aggregation, grouping, and ordering.
-- Refer to the FitPro_Schemas.sql file for database & table creation.

-- 1) Retrieve the Memeber ID and membership_type of female members.

SELECT member_id,membership_type
FROM memberships
WHERE gender ='F'

-- 2) Find members who have a Monthly membership and joined after 2023-11-01.

SELECT *
FROM memberships
WHERE membership_type = 'Monthly' AND join_date > '2023-11-01'

-- 3) List members with a Quarterly membership aged between 20 and 30.

SELECT *
FROM memberships
WHERE membership_type = 'Quaterly' AND AGE BETWEEN 20 AND 30

-- 4) Count members by membership type (e.g., Monthly, Weekly, Quarterly) and arrange in ascending order.

SELECT membership_type, COUNT(member_id) AS member_count
FROM memberships
GROUP BY membership_type
ORDER BY member_count ASC

-- 5) Calculate the average age of members, grouped by membership type in descending order of age.

SELECT membership_type, AVG(age) AS average_age
FROM memberships
GROUP BY membership_type
ORDER BY average_age DESC

-- 6) Ascertain the total visits for each visit date and list the top 10 days with maximum visits.

SELECT visit_date, COUNT(visit_id) AS total_visits
FROM visits
GROUP BY visit_date
ORDER BY total_visits DESC
LIMIT 10


-- 7) Top 3 members with the highest visits.

SELECT member_id, COUNT(visit_id) AS total_visits
FROM visits
GROUP BY member_id
ORDER BY total_visits DESC
LIMIT 3

-- 8) Members who joined in 2023, grouped by membership type (where each group has > 100 members)

SELECT membership_type, COUNT(member_id) AS enrollments
FROM memberships
WHERE join_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY membership_type
HAVING COUNT(member_id) > 100
ORDER BY enrollments

-- 9) Members with more than 2 visits, sorted by total visits, displaying the top 5. 

SELECT member_id, COUNT(visit_id) AS total_visits
FROM visits
GROUP BY member_id
HAVING COUNT(visit_id) > 2
ORDER BY total_visits DESC
LIMIT 5

SELECT * from memberships

-- 10) Active members grouped by membership type, sorted by total visits.

SELECT memberships.membership_type, COUNT(visits.visit_id) AS total_visits
FROM memberships
JOIN visits ON memberships.member_id = visits.member_id
WHERE status = 'Active' AND 
GROUP BY memberships.membership_type
ORDER BY total_visits DESC



