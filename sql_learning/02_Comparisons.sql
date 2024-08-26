/* Comparisons
Używamy głównie w WHERE or HAVING 
Operatory porówniania:
=, <>, >, <, >=, <=
Operatory logiczne 
AND, OR, BETWEEN, IN 
*/

-- <> --> NOT --> NOT equal to 

SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE
    job_via <> 'via LinkedIn'
-- nie wczytuje pracy znajdujących się na LinkedIn --> <> --> NOT equal

SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE NOT
    job_via = 'via LinkedIn';
-- robi to samo co wyżej --> WHERE NOT --> które nie są 


SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg > 150000
ORDER BY 
    salary_year_avg;
-- pokaże nam tylko te dane gdzie pensja roczna jest większa od 150000


-- AND 
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg > 150000 AND
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg;
-- wyświetlenie tylko danych, dla których prawdą jest --> nazwa pracy 'Data Analyst' oraz zarobki roczne większe niż 150000


-- OR
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg > 150000 OR
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg;
-- musi spełniać przynajmniej jeden z warunków --> albo "Data Analyst" albo więcej niz 150000 zarobków --> może spełniać oba


-- BETWEEN --> zamieninik używania > AND <
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg BETWEEN 120000 AND 130000
ORDER BY 
    salary_year_avg;
-- prace o zarobkach pomiędzy 120000 a 130000 


-- IN --> zastąpienie OR
SELECT
    job_id,
    job_title_short,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_title_short IN ('Data Analyst', 'Data Engineer')
ORDER BY 
    salary_year_avg;
-- znajdzie tylko pracę o nazwię 'Data Analyst' oraz 'Data Engineer'
