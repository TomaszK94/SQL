/*
Aggreagation functions:
SUM() --> dodaje wszystkie wartości z specyficznych kolumn
COUNT() --> zlicza liczbę wierszy, która pasuje do specyficznych kryteriów
AVG() --> liczy wartość średnią z danej kolumny
MAX() --> znajduję wartość maksymalną
MIN() --> znajduję wartość minimalną

Można również używać w conjuction --> GROUP BY / HAVING
*/



-- ile wynosi wartość rocznych pensji wszystkich zsumowanych prac
SELECT 
	SUM(salary_year_avg) AS salary_sum
FROM 
	job_postings_fact;


-- ile wynosi wartość rocznych pensji wszystkich zsumowanych prac oraz zliczenie ile wszystkich wierszy było w tym sumowaniu
SELECT 
	SUM(salary_year_avg) AS salary_sum,
    COUNT(*) AS count_rows
FROM 
	job_postings_fact;


-- ile jest unikatowych nazw krótkich w przeszukiwanym zbiorze danych ---> COUNT(DISTINCT kolumna szukana)
SELECT 
	COUNT(DISTINCT job_title_short) AS job_type_total
FROM 
	job_postings_fact



-- średnia pensja ze wszystkich prac jakie są w bazie danych --> bierze do średniej również pracę bez podanego wynagrodzenia
SELECT 
	AVG(salary_year_avg) AS avg_salary
FROM 
	job_postings_fact


-- średnia pensja z ofert dla 'Data Analysta'
SELECT 
	AVG(salary_year_avg) AS avg_salary
FROM 
	job_postings_fact
WHERE
	job_title_short = 'Data Analyst';



-- średnia, minimalna oraz maksymalna oferta pracy dla 'Data Analysta'
SELECT 
	AVG(salary_year_avg) AS avg_salary,
    MIN(salary_year_avg) AS min_salary,
    MAX(salary_year_avg) AS max_salary
FROM 
	job_postings_fact
WHERE
	job_title_short = 'Data Analyst';


/*
GROUP BY --> aggregate/groupings fukcja
grupuje wiersze "z tą samą wartością" z zadanej kolumny, tworząc podsumowujący wiersz --->
np --> grupujemy coś po nazwach pracy --> tworzą się nam tylko unikatowe wiersze z nazwami pracy --> unikatowe wiersze przetrzymują zsumowane wartości wszystkich wierszy o tej samej nazwie...
*/

/*
tworzymy listę prac z unikatowymi nazwami (jest takich 10) GROUP BY to zrobi --> podsumowujemy wszystkie wiersze z daną pracą za pomocą GROUP BY --> 
następnie liczona jest z tego średnia, min oraz max
*/
SELECT 
	job_title_short AS jobs,
	AVG(salary_year_avg) AS avg_salary,
    MIN(salary_year_avg) AS min_salary,
    MAX(salary_year_avg) AS max_salary
FROM 
	job_postings_fact
GROUP BY
	job_title_short
ORDER BY
	avg_salary;


/*
HAVING --> używamy jej jak WHERE, ale dla query na funkcjach aggregate lub groupings --> jak mamy GROUP BY to WHERE nie zadziała używamy HAVING
robimy dzięki HAVING warunki, które sprawdzamy czy są TRUE/FALSE
*/

-- na podstawie list płac z powyżej dodajemy kolumnę która zlicza nam ilość ofert pracy danej nazwy --> np. 'Data Analyst'
-- następnie za pomocą HAVING wyświetlamy tylką tą listę płac, gdzie ofert występujących pod daną nazwą występuje więcej niż 20000
SELECT 
	job_title_short AS jobs,
    COUNT(job_title_short) AS job_count,  -- ile jest stanowisk o danej nazwie
	AVG(salary_year_avg) AS avg_salary,
    MIN(salary_year_avg) AS min_salary,
    MAX(salary_year_avg) AS max_salary
FROM 
	job_postings_fact
GROUP BY
	job_title_short
HAVING
	COUNT(job_title_short) > 20000
ORDER BY
	avg_salary;