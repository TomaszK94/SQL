/*
AS --> rename a column in a table; a temporary name (alias)
AS --> działa również na zmianę nazwy tabeli co przyda się przy łączeniu
*/

SELECT 
	jpc.job_title_short AS job_title,
    jpc.job_location AS location,
    jpc.job_via AS online_platform,
    jpc.salary_year_avg AS salary
FROM
	job_postings_fact AS jpc

-- można pisać bez AS i też zadziała ale jest nieczytelne !!!
SELECT 
	jpc.job_title_short job_title,
    jpc.job_location location,
    jpc.job_via online_platform,
    jpc.salary_year_avg salary
FROM
	job_postings_fact jpc