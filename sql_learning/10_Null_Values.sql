/*
NULL values 
NULL - a field with no value --> nie jest tożsame z komórką o wartości 0 lub zawierającą pusty string --> spację --> " "
Operacje na NULL robimy w sekcji WHERE/HAVING
*/


SELECT
	job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
	job_postings_fact
ORDER BY
	salary_year_avg DESC;

-- po odjęciu ofert pracy z brakiem wynagrodzenia
SELECT
	job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
	job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
ORDER BY
	salary_year_avg DESC;
