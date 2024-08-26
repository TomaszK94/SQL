/*
UNION Operatots
Combine result sets of two or more SELECT statement into a single result set.
    - UNION --> Remove duplicate rows
    - UNION ALL --> Includes all duplicate rows

EACH SELECT statement within the UNION must have the same number of columns in the result sets with similar data types.
*/

SELECT *
FROM january_jobs

SELECT * 
FROM february_jobs

SELECT * 
FROM march_jobs


/*
UNION - combines results from two or more SELECT statements
THEY NEED TO HAVE THE SAME AMOUNT OF COLUMNS, AND THE DATE TYPE MUST MATCH
ALL rows are unique --> delete duplicate rows

SELECT column_name
FROM table_name

UNION -- combine the two tables

SELECT column_name
FROM table_two;
*/

-- Get jobs and comapnies from January
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION 
-- Get jobs and companies from February
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION
-- Get jobs and companiues from March
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs


/*
UNION ALL - combines results from two or more SELECT statements
THEY NEED TO HAVE THE SAME AMOUNT OF COLUMNS, AND THE DATE TYPE MUST MATCH
CREATING ROWS DUPLICATE --> not unique rows

SELECT column_name
FROM table_name

UNION ALL -- combine the two tables

SELECT column_name
FROM table_two;
*/

-- Get jobs and comapnies from January
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL
-- Get jobs and companies from February
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL
-- Get jobs and companiues from March
SELECT 
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs