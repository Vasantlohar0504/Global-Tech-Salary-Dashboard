/* ======================================================
   Global Tech Salary Dashboard - SQL Analysis File
   Dataset: Latest_Data_Science_Salaries.csv
   Database: tech_salary_dashboard
====================================================== */

USE tech_salary_dashboard;

/* ======================================================
1. View first 10 rows
====================================================== */
SELECT *
FROM salaries
LIMIT 10;


/* ======================================================
2. Total number of records
====================================================== */
SELECT COUNT(*) AS total_records
FROM salaries;


/* ======================================================
3. Distinct job titles
====================================================== */
SELECT DISTINCT job_title
FROM salaries
ORDER BY job_title;


/* ======================================================
4. Total number of job roles
====================================================== */
SELECT COUNT(DISTINCT job_title) AS total_job_roles
FROM salaries;


/* ======================================================
5. Average salary across dataset
====================================================== */
SELECT AVG(salary_in_usd) AS average_salary
FROM salaries;


/* ======================================================
6. Highest salary in dataset
====================================================== */
SELECT MAX(salary_in_usd) AS highest_salary
FROM salaries;


/* ======================================================
7. Lowest salary in dataset
====================================================== */
SELECT MIN(salary_in_usd) AS lowest_salary
FROM salaries;


/* ======================================================
8. Average salary by job title
====================================================== */
SELECT job_title,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title
ORDER BY avg_salary DESC;


/* ======================================================
9. Top 10 highest paying job titles
====================================================== */
SELECT job_title,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;


/* ======================================================
10. Salary distribution by experience level
====================================================== */
SELECT experience_level,
COUNT(*) AS total_employees,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY experience_level
ORDER BY avg_salary DESC;


/* ======================================================
11. Salary by employment type
====================================================== */
SELECT employment_type,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY employment_type;


/* ======================================================
12. Salary by company size
====================================================== */
SELECT company_size,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_size;


/* ======================================================
13. Average salary by company location
====================================================== */
SELECT company_location,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_location
ORDER BY avg_salary DESC;


/* ======================================================
14. Top 10 highest paying countries
====================================================== */
SELECT company_location,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_location
ORDER BY avg_salary DESC
LIMIT 10;


/* ======================================================
15. Salary trend by year
====================================================== */
SELECT year,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY year
ORDER BY year;


/* ======================================================
16. Number of employees by experience level
====================================================== */
SELECT experience_level,
COUNT(*) AS employee_count
FROM salaries
GROUP BY experience_level
ORDER BY employee_count DESC;


/* ======================================================
17. Salary comparison by employee residence
====================================================== */
SELECT employee_residence,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY employee_residence
ORDER BY avg_salary DESC;


/* ======================================================
18. Top 5 highest paid employees (salary records)
====================================================== */
SELECT job_title,
company_location,
salary_in_usd
FROM salaries
ORDER BY salary_in_usd DESC
LIMIT 5;


/* ======================================================
19. Average salary by job title and experience level
====================================================== */
SELECT job_title,
experience_level,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title, experience_level
ORDER BY avg_salary DESC;


/* ======================================================
20. Salary insights by company size and experience
====================================================== */
SELECT company_size,
experience_level,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY company_size, experience_level
ORDER BY avg_salary DESC; 

/* ======================================================
21. Rank job titles by average salary
====================================================== */
SELECT 
job_title,
AVG(salary_in_usd) AS avg_salary,
RANK() OVER (ORDER BY AVG(salary_in_usd) DESC) AS salary_rank
FROM salaries
GROUP BY job_title;


/* ======================================================
22. Top paying job per country
====================================================== */
SELECT *
FROM (
    SELECT 
    company_location,
    job_title,
    AVG(salary_in_usd) AS avg_salary,
    RANK() OVER (PARTITION BY company_location ORDER BY AVG(salary_in_usd) DESC) AS rank_in_country
    FROM salaries
    GROUP BY company_location, job_title
) ranked_jobs
WHERE rank_in_country = 1;


/* ======================================================
23. Salary percentile using NTILE
====================================================== */
SELECT 
job_title,
salary_in_usd,
NTILE(4) OVER (ORDER BY salary_in_usd DESC) AS salary_quartile
FROM salaries;


/* ======================================================
24. Running average salary by year
====================================================== */
SELECT 
year,
AVG(salary_in_usd) AS avg_salary,
AVG(AVG(salary_in_usd)) OVER (ORDER BY year) AS running_avg_salary
FROM salaries
GROUP BY year;


/* ======================================================
25. Highest salary per experience level
====================================================== */
SELECT 
experience_level,
job_title,
salary_in_usd
FROM (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY experience_level ORDER BY salary_in_usd DESC) AS rank_num
    FROM salaries
) ranked
WHERE rank_num = 1;


/* ======================================================
26. Compare salary to global average
====================================================== */
SELECT 
job_title,
salary_in_usd,
salary_in_usd - (SELECT AVG(salary_in_usd) FROM salaries) AS difference_from_avg
FROM salaries
ORDER BY difference_from_avg DESC;


/* ======================================================
27. Salary growth by year
====================================================== */
SELECT 
year,
AVG(salary_in_usd) AS avg_salary,
LAG(AVG(salary_in_usd)) OVER (ORDER BY year) AS previous_year_salary,
AVG(salary_in_usd) - LAG(AVG(salary_in_usd)) OVER (ORDER BY year) AS salary_growth
FROM salaries
GROUP BY year;


/* ======================================================
28. Top 5 highest paid job titles per experience level
====================================================== */
SELECT *
FROM (
    SELECT 
    experience_level,
    job_title,
    AVG(salary_in_usd) AS avg_salary,
    RANK() OVER (PARTITION BY experience_level ORDER BY AVG(salary_in_usd) DESC) AS rank_position
    FROM salaries
    GROUP BY experience_level, job_title
) ranked_jobs
WHERE rank_position <= 5;


/* ======================================================
29. Salary difference between company sizes
====================================================== */
SELECT 
company_size,
AVG(salary_in_usd) AS avg_salary,
AVG(salary_in_usd) - 
(SELECT AVG(salary_in_usd) FROM salaries) AS difference_from_global_avg
FROM salaries
GROUP BY company_size;

/* ======================================================
30. Identify high-paying jobs (above average)
====================================================== */

SELECT 
job_title,
AVG(salary_in_usd) AS avg_salary
FROM salaries
GROUP BY job_title
HAVING AVG(salary_in_usd) > (
    SELECT AVG(salary_in_usd) FROM salaries
)
ORDER BY avg_salary DESC;