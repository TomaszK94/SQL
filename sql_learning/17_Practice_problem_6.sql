/*
Create table from Other tables

Create three tables:
- JAN 2023 JOBS
- FEB 2023 JOBS
- MAR 2023 JOBS
*/

-- tylko styczniowe prace
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- tylko lutowe prace
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- tylko marcowe prace
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT *
FROM january_jobs

SELECT *
FROM february_jobs

SELECT *
FROM march_jobs