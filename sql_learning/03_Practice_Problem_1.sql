/*
Pracę wykonywane tylko w Bostonie lub zdalnie(Anywhere) + 
+ Pracę Data Analysta za więcej niż 100000 rocznie lub 
Pracę Business Analysta za więcej niż 70000 rocznie
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
    job_location in ('Boston, MA', 'Anywhere') AND
    (
    (job_title_short = 'Data Analyst' AND salary_year_avg > 100000) OR
    (job_title_short = 'Business Analyst' AND salary_year_avg > 70000)
    )  
ORDER BY
    salary_year_avg;
