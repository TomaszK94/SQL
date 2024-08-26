/* BASIC KEYWORDS
Practice Problem 1
Get the unique (distinc) job locations in the job_posting_fact table. Order in alphabetical order (ascending order).
*/
SELECT DISTINCT
    job_location
FROM
    job_postings_fact
ORDER BY
    job_location;


/* Practice Problem 2
In the job_postings_fact table get the columns job_id, job_title_short, job_location, and job_via columns. And order it in descending order by job_location.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via
FROM
    job_postings_fact
ORDER BY
    job_location DESC;


/* Practice Problem 3 
In the job_postings_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. And only look at rows where job_title_short is 'Data Engineer'
and job_location is 'Kraków, Poland'. Then order it in ascending order by salary_year_avg. 
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer' AND
    job_location = 'Kraków, Poland'
ORDER BY 
    salary_year_avg;



/* COMPARISONS
Practice Problem 1 
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only return rows where the job location is in 'Kraków, Poland'.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    job_location = 'Kraków, Poland'
ORDER BY
    salary_year_avg;


/* Practice Problem 2
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only return 'Full-time' jobs (job_schedule_type column).
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    -- job_schedule_type, 
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    job_schedule_type = 'Full-time'
ORDER BY
    salary_year_avg;


/* Practice Problem 3
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only look at jobs that are not 'Part-time' jobs (job_schedule_type column).
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    -- job_schedule_type, 
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE NOT
    job_schedule_type = 'Part-time'
ORDER BY
    salary_year_avg;
-- wyrzyca nam tylko wierwsze gdzie jest wyłącznie 'Part-time'--> nie wyrzuca łączonoych rekordów tj. 'Part-time and Full-time'


/* Practice Problem 4
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only look at jobs that are not posted 'via LinkedIn'.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    job_via <> 'via LinkedIn' AND
    job_via <> 'via Linkedin'
ORDER BY
    job_via;


/* Practice Problem 5
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only get jobs that have an average yearly salary of 65.000 or greater.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    salary_year_avg >= 65000
ORDER BY
    salary_year_avg;


/* Practice Problem 6
In the job_postings_fact table get the job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only get jobs that have an average yearly salary less then 110000.
*/
SELECT
    job_id,
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE
    salary_year_avg < 110000
ORDER BY
    salary_year_avg;



/* WILDCARDS
Practice Problem 1 
In the company_dim table find all company names that include 'Tech' immediately followed by any single character. Return the name column.
*/

SELECT
    name
FROM
    company_dim
WHERE
	name LIKE 'Tech%'
-- immediately followed by any single character --> po którym może być każdy możliwy znak??



/* Practice Problem 2
Find all job postings in the job_postings_fact where the job_title is exactly "Engineer" and one character followed after the term. Get the job_id, job_title, and job_posted_date.
*/
SELECT
    job_id,
    job_title,
    job_posted_date
FROM
    job_postings_fact
WHERE
    job_title LIKE 'Engineer_'
-- tylko jeden znak występujący po słowie Engineer




/* Alias --> AS
Practice Problem 1 
From the job_postings_fact return the following columns: job_id, job_title_short, job_location, job_via, job_posted_date, and salary_year_avg. Also, rename the following: 
job_via to job_posted_site and salary_year_avg to avg_yearly_salary.
*/

SELECT
    job_id,
    job_title_short,
    job_location,
    job_via AS job_posted_site,
    job_posted_date,
    salary_year_avg AS avg_yearly_salary
FROM
    job_postings_fact




/* Operations + - * / %
Practice Problem 1 
In the invoice_fact table add the hours_spent to the hours_rate. This could be used to prioritize tasks, higher values could indicate tasks that are both time-intensive and costly,
therefore requring early attention. 

Program nie będzie działał brak bazy danych do sprawdzenia na https://lukeb.co/sql_invoices_db  
*/
SELECT 
	hours_spent,
    hours_rate,
    hours_spent + hours_rate AS priority_task
FROM
	invoices_fact
ORDER BY
	priority_task DESC;


/* Operations + - * / %
Practice Problem 2 
In the invoices_fact table divide the hours_spent by the hours_rate. Return the activity_id as well. This helps give us an efficiency ration a lower ratio could indicate
a more cost-efficient task.

Program nie będzie działał brak bazy danych do sprawdzenia na https://lukeb.co/sql_invoices_db  
*/
SELECT 
	activity_id,
    hours_spent,
    hours_rate,
    hours_spent / hours_rate AS efficiency_ration
FROM
	invoices_fact
ORDER BY
	efficiency_ration;
-- the most cost effiency tasks --> projekt w którym w jak najkrótszym czasie zarobimy najwięcej pieniędzy 


/* Aggregation
Practice Problem 1
In the job_postings_fact table count the total number of job postings that offer health insurance. Use the job_health_insurance columnd to determine if a job posting offers health inusrance
(True means it does offer health insurance)
*/

SELECT 
    job_title_short,
    COUNT(job_health_insurance) AS health_insurance_provided
FROM
	job_postings_fact
WHERE
	job_health_insurance = TRUE
GROUP BY 
	job_title_short
ORDER BY
	health_insurance_provided;

-- sprawdzenie 
SELECT 
    COUNT(job_health_insurance) AS health_insurance_true
FROM
	job_postings_fact
WHERE
	job_health_insurance = True;

-- sprawdzenie x2
SELECT 
    job_title_short,
    job_health_insurance AS health_insurance_true
FROM
	job_postings_fact
WHERE
	job_health_insurance = True;


/* Aggregation
Practice Problem 2
In the job_postings_fact table calculate the total sum of the average yearly salary (salary_year_avg) for all job postings that are marked as fully remote(job_work_from_home = TRUE) and divide
it by the total count of salary_year_avg. To get total average yearly salary for fullly remote jobs. Ensure to only include job posings where a yearly salary is specified 
(salary_year_avg is not NULL)
*/

SELECT
    SUM(salary_year_avg) AS avg_salary,
    COUNT(salary_year_avg) AS job_count,  -- to w tym momencie już nie liczy wartości NULL --> pustych
    (SUM(salary_year_avg) / COUNT(salary_year_avg)) AS avg_remote_salary
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE


-- sprawdzenia
SELECT 
    salary_year_avg,
    job_work_from_home
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE


/* Aggregation
Practice Problem 3
In the job_postings_fact table count the number of job postings avaible for each country. Use the job_country column to group the job postings and count the number of job postings (job_id) 
within each country group.
*/

SELECT 
    job_country AS country,
    COUNT(job_id) AS number_of_jobs
FROM
    job_postings_fact
GROUP BY 
    job_country;


-- sprawdzanie
SELECT
    job_country,
    job_id
FROM
    job_postings_fact
WHERE
    job_country = 'Belarus';


/* NULL values
Practice Problem 1
We're going to check that all skills that do not have a category assigned to it. This can be used for validating data. So, get all skill from the skills_dim table that don't have
a type classification assigned to them. Return the skill_id and skills. 
*/

SELECT
    skill_id,
    skills
FROM 
    skills_dim
WHERE 
    type IS NULL
ORDER BY
    skill_id;
-- puste zapytanie każdy wiersz w kolumnie type ma przypisaną wartość!! 

SELECT
    skill_id,
    skills,
    type
FROM 
    skills_dim
WHERE 
    type IS NOT NULL
ORDER BY
    skill_id;
-- sprawdzenie/wizualizacja braku pustych wierszy


/* NULL values
Practice Problem 2
Identify all job postings that have neither an annual average salary(salary_year_avg) nor an hourly average salary(salary_hour_avg) in the job_postings_fact table. Return the job_id,
job_title, salary_year_avg, salary_hour_avg. This can be useful to look at postings where there's no compenastion.
*/

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    salary_hour_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NULL AND
    salary_hour_avg IS NULL;
-- prace bez podanych żądnych danych o wynagrodzeniu --> zdecydowana większość

SELECT 
    job_id,
    job_title,
    salary_year_avg,
    salary_hour_avg
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL OR
    salary_hour_avg IS NOT NULL;
-- pracę które mają podaną albo roczną albo godzinową stawkę


/* JOINS
Practice Problem 1
Retrieve the list of job titles (job_title) and the coreesponding company names (name) for all job postings that mention 'Data Scientist' in the job title. Use the job_postings_fact
company_dim table for this query
*/

SELECT
    job_post.job_id,
    job_post.job_title,
    -- job_post.company_id, -- po tym łączymy --> test
    -- company.company_id, -- po tym łączymy --> test
    company.name
FROM
    job_postings_fact AS job_post
INNER JOIN company_dim AS company ON job_post.company_id = company.company_id
WHERE 
    job_post.job_title = 'Data Scientist'
ORDER BY
    job_post.job_id;

/* JOINS
Practice Problem 2
Fetch all job postings, including their job title (job_title) and the names of the skills requres (skills), even if no skills are listed for a job. Ensure that the job is located in "New York"
and offers "Health insurance". Use the job_postings_fact, skills_job_dim, and skills_dim table.
*/

SELECT
    job_post.job_id,
    job_post.job_title,
    job_post.search_location,
    job_post.job_health_insurance,
    -- skill_list.skill_id AS nr1,  -- Test
    -- skills.skill_id AS nr2,      -- Test
    skills.skills
FROM
    job_postings_fact AS job_post
LEFT JOIN skills_job_dim AS skill_list ON job_post.job_id = skill_list.job_id
LEFT JOIN skills_dim AS skills ON skills.skill_id = skill_list.skill_id
WHERE
    job_post.search_location LIKE '%New York%' AND
    job_post.job_health_insurance = TRUE
ORDER BY
    job_post.job_id;



/* Date Functions
Practice Problem 1
Write a query to find the average salary both yearly(salary_year_avg) and hourly (salary_hour_avg) for job postings that were posted after June 1, 2023.
Group the results by job_schedule_type
*/

SELECT 
    job_schedule_type,
    AVG(salary_year_avg) AS avg_yearly,
    AVG(salary_hour_avg) AS avg_hourly
    -- EXTRACT(MONTH FROM job_posted_date) AS date_month
FROM 
    job_postings_fact
WHERE 
    EXTRACT(MONTH FROM job_posted_date) >= 6
GROUP BY
    job_schedule_type
HAVING
    AVG(salary_year_avg) IS NOT NULL OR
    AVG(salary_hour_avg) IS NOT NULL  -- sprawdzamy stanowiska tylko gdzie jest podane wynagrodzenie albo roczne/miesieczne
ORDER BY 
    job_schedule_type;


-- sprawdzenie pojedynczego trybu pracy
SELECT 
    AVG(salary_year_avg) AS avg_yearly,
    AVG(salary_hour_avg) AS avg_hourly
FROM
    job_postings_fact
WHERE
    job_schedule_type = 'Full-time' AND
    EXTRACT(MONTH FROM job_posted_date) >= 6
-- test


/* Date Functions
Practice Problem 2
Write a query to count the number of job postings for each month in 2023, adjusting the job_posted_date to be in 'America/New_York' time zone before extracting (hint) the month.
Assume the job_posted_date is stored in UTC. Group by and order by the month.
*/

SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EDT')) AS month
FROM
    job_postings_fact
WHERE 
    EXTRACT(YEAR FROM job_posted_date) = 2023
GROUP BY
    month
ORDER BY 
    month;

/* Date Functions
Practice Problem 3
Write a query to find companies (include company name) that have posted jobs offering health insurance, where these postings were made in the secound quarter of 2023. 
Use date extraction to filter by quarter.
*/

SELECT
    company.name,
    company.company_id,  -- do testów
    COUNT(job_postings.job_health_insurance) AS work_offerts
    -- job_postings.job_health_insurance
    -- job_postings.job_posted_date
FROM
    job_postings_fact AS job_postings
INNER JOIN company_dim AS company ON job_postings.company_id = company.company_id 
WHERE
    job_health_insurance = TRUE AND
    EXTRACT(MONTH FROM job_postings.job_posted_date) BETWEEN 4 AND 6
GROUP BY
    company.company_id
ORDER BY 
    company.name
/*
zmiana założenia zadania przez niezrozumiałą treść --> wygenerowane zostały wszystkie firmy (z uwzględnieniem nazw), które w drugim kwartale oferowały chociaż jedną pracę, 
w której była zapewniona opieka zdrowotna. Dodatkowo policzono ile było ofert od danej firmy spełniające to założenie w drugim kwartale roku 2023.
Nie sprawdzano po roku bo oferty pracy z innych lat są to oferty 2022-12 więc nie wpływają na zapytanie. 
*/


-- sprawdzenie
SELECT 
    company_id,
    job_title,
    job_health_insurance,
    job_posted_date
FROM 
    job_postings_fact
WHERE
    company_id = 4190
ORDER BY 
    job_posted_date;



/* CASE WHEN
Practice Problem 1
Categorize the salaries from each job posting. To see if it fits in my desired salary range.
- Put salary into defferent buckets
- Define what's a high, standard, or low salary with our own conditions
- Look only at data analyst roles
- Order from highest to lowest 
*/


SELECT
    job_id,
    job_title,
    job_title_short,
    salary_year_avg,
    CASE
        WHEN salary_year_avg BETWEEN 0 AND 70000 THEN 'lov salary'
        WHEN salary_year_avg BETWEEN 70001 AND 120000 THEN 'standard salary'
        ELSE 'high salary'
    END AS salary_lvl
FROM   
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg;



/* SubQueries and CTEs
Practice Problem 1
Identify the top 5 skills that are most frequenly mentioned in job postings. Use a subquery to find the skill IDs with the highest counts in the skill_job_dim table
and then join this result with the skills_dim table to get skill names.
*/

SELECT
    skills_dim.skills,
    job_offers.count_job
FROM (
SELECT 
    skill_id,
    COUNT(job_id) AS count_job
FROM 
    skills_job_dim
GROUP BY 
    skill_id
ORDER BY
    count_job DESC
LIMIT 5
) AS job_offers
LEFT JOIN skills_dim ON skills_dim.skill_id = job_offers.skill_id
ORDER BY
    count_job DESC;


/* SubQueries and CTEs
Practice Problem 2
Determine the size category ("Small", "Medium", "Large") for each company by first identifying the number of job postings they have. Use a subquery to calculate the total
postings per company. A company is considered "Small" if it has less than 10 job postings, "Medium" if the number of job postings is between 10 and 50, and "Large" if it has
more then 50 job postings. Implement a subquery to aggregate job counts per company before classyfing them based on size.
*/

SELECT
    company_dim.company_id,
    company_dim.name,
    job_offers.job_posted,
    CASE
        WHEN job_offers.job_posted < 10 THEN 'Small'
        WHEN job_offers.job_posted BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM (
SELECT
    company_id,
    COUNT(job_id) AS job_posted
FROM
    job_postings_fact
GROUP BY
    company_id
ORDER BY
    company_id
) AS job_offers
LEFT JOIN company_dim ON company_dim.company_id = job_offers.company_id
ORDER BY
    company_dim.company_id;


/* UNION Operators
Practice Problem 1
    - Get the correspondging skill and skill type for each job posting in q1
    - Includes those without any skills, too
    - Look at the skills and the type for each job in the first quarter that has a salary > $70,000
*/


SELECT 
    quarter1_job_postings.job_id,
    job_title_short,
    company_id,
    skills.skill_id,
    skills_name.skills,
    skills_name.type,
    job_posted_date::DATE,
    salary_year_avg
FROM (
SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT * 
FROM march_jobs
) AS quarter1_job_postings
LEFT JOIN skills_job_dim AS skills ON skills.job_id = quarter1_job_postings.job_id
INNER JOIN skills_dim AS skills_name ON skills_name.skill_id = skills.skill_id
WHERE salary_year_avg > 70000
ORDER BY quarter1_job_postings.job_id



SELECT 
    skills_name.skill_id,
    skills_name.skills,
    skills_name.type,
    COUNT(skills.skill_id) AS number_of_jobs
FROM (
SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT * 
FROM march_jobs
) AS quarter1_job_postings
LEFT JOIN skills_job_dim AS skills ON skills.job_id = quarter1_job_postings.job_id
INNER JOIN skills_dim AS skills_name ON skills_name.skill_id = skills.skill_id
WHERE salary_year_avg > 70000
GROUP BY skills_name.skill_id
ORDER BY number_of_jobs DESC;


SELECT 
    skills_name.type,
    COUNT(skills_name.type) AS number_of_jobs
FROM (
SELECT *
FROM january_jobs
UNION ALL
SELECT *
FROM february_jobs
UNION ALL
SELECT * 
FROM march_jobs
) AS quarter1_job_postings
LEFT JOIN skills_job_dim AS skills ON skills.job_id = quarter1_job_postings.job_id
INNER JOIN skills_dim AS skills_name ON skills_name.skill_id = skills.skill_id
WHERE salary_year_avg > 70000
GROUP BY skills_name.type
ORDER BY number_of_jobs DESC;