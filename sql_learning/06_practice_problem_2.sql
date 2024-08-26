/*
Oferty pracy w których jest słowo 'Data' lub 'Business' +
zawsze ma być w nich słowo 'Analyst' +
nie może w ich nazwie być 'Senior'
*/

SELECT 
	job_title,
    job_location AS location, 
    salary_year_avg AS salary
FROM
	job_postings_fact
WHERE
	(job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
    job_title LIKE '%Analyst%' AND
    job_title NOT LIKE '%_enior%'; -- aby nie było różnicy pomiędzy 'Senior' a 'senior'

