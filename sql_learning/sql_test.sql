-- Run to test if diffrent tables are loaded correctly
SELECT *
FROM company_dim
ORDER BY company_id
LIMIT 100;

SELECT *
FROM job_postings_fact
ORDER BY job_id
LIMIT 100;

SELECT *
FROM skills_dim
LIMIT 100;

SELECT *
FROM skills_job_dim
ORDER BY job_id
LIMIT 100;
