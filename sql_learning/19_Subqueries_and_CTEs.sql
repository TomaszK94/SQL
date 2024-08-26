/* 
Subqueries and CTEs (Common Table Expressions): Used for organizing and simplifying complex queries 
- Helps break down the query into smaller, more manageable parts
Subqueries are for simpler queries 
CTEs are for more complex queries
*/


/*
Subqueries: query nested inside a larger query:
- It can be used in SELECT, FROM, WHERE clauses
*/ 

SELECT *
FROM ( -- SubQuery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS january_jobs;
-- SubQuery end here


/* 
Common Table Expressions (CTEs): define a temporary result set that you can reference
- Can reference within a SELECT, INSERT, UPDATE, DELETE statement
- Defined with WITH
*/

WITH january_jobs AS ( --CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) -- CTE definition ends heer

SELECT *
FROM january_jobs;



/*
Subqueries - query within another query
It can be used in several places in the main query:
- Such as the SELECT, FROM, WHERE, HAVING clauses
It's executed first, and the results are passed to the outer query:
- It is used when you want to perform a calculation before the main query can complete its calculation
*/


SELECT
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE 
    company_id IN (
SELECT
    company_id
FROM
    job_postings_fact
WHERE
    job_no_degree_mention = TRUE
)
ORDER BY
    company_id



/*
CTEs - Common Table Expression
CTE - A temporary result set that you can reference within a SELECT INSERT UPDATE or DELETE statement.
Exsists only during the execution of query
It's a defined query that can be referenced in the main query or other CTEs
WITH - used to define CTE at the beggining of a query

WITH january_jobs AS ( -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT *
FROM 
    january_jobs;
*/


/* CTEs PROBLEM
Find the companies that have the most job openings.
- Get the total number of job postings per company id
- Return the total number of jobs with the company name
*/

WITH company_job_count AS (
SELECT
    company_id,
    COUNT(job_id) AS total_jobs
FROM
    job_postings_fact
GROUP BY
    company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM 
    company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    company_job_count.total_jobs DESC;