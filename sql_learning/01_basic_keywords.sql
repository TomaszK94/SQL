-- SELECT --> przytoczenie jakich kolumn/daty chcemy użyć z przytoczonej tabeli --> * oznacza wszystkie kolumny
-- FROM --> określenie z jakiej tabeli chcemy pobrać dane


-- sqliteviz --> online workspace for free


SELECT *
FROM job_postings_fact
-- z tabeli job_postings_fact ładujemy wszystkie kolumny 


SELECT *
FROM company_dim
-- z tabeli company_dim ładujemy wszystkie kolumny


-- nie jest konieczne ładowania wszystkich kolumn --> * --> zamiast tego można samemu określać, które kolumny chcemy ładować
SELECT 
    job_title_short, 
    job_location
FROM 
    job_postings_fact
-- załadowano tylko kolumny job_title_short oraz job_location z tabeli job_postings_fact


-- warto również określać w SELECT, z której tabeli kolumny ładujemu --> jest to istotne przy łączeniu tabeli
SELECT
    job_postings_fact.job_title_short,
    job_postings_fact.job_location
FROM
    job_postings_fact
-- ładujemny kolumny job_tittle_short i job_location znajdujące się w tabeli job_postings_fact --> z tabeli job_postings_fact --> istotne dopiero przy kombinacji kilku tabel razem


-- LIMIT --> wyrzuca nam ilość wierszy, które zdefiniujemy w Limicie --> LIMIT 5 --> tylko 5 wierszy 
SELECT 
    job_title_short,
    job_location
FROM
    job_postings_fact
LIMIT 5
-- ładujemy te same dane lecz nie wszystkie lecz tylko 5 pierwszych wierszy zapisanych w naszej bazie 


-- SELECT DISTINCT --> POKAŻ TYLKO UNIKALNE WARTOŚCI Z WIERSZY --> bez powtarzania --> raczej nie używana do całej tabeli tylko wyszukiwania poszczególnych wartości z pojedynczych kolumn
SELECT DISTINCT
    job_title_short
FROM 
    job_postings_fact;
-- Wyświetlimy tylko unikalne wartości job_title_short z tabeli job_postings_fact --> zapytanie warto dla odróżnienia kończyć za pomocą ";"


-- WHERE --> określenie warunku --> dostaniemy tylko te dane, które będą spełniały warunek, który podaliśmy --> zaawansopwane filtrowanie
SELECT
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst';
-- załadujemy tylko wiersze, w których w kolumnie job_title_short --> występuje string Data Analyst --> wartości str określamy w ''
SELECT
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    salary_year_avg > 90000;
-- załadujemy tylko wiersze, gdzie roczna pensja jest większa od 90000


-- Single Line Comment

/*
multi
line
comment
*/


-- ORDER BY --> upożądkowany w dany sposób --> porządkuje wiersze w zadany sposób --> domyślnie ascending --> ASC (smallest -> largest) --> określamy po jakiej kolumnie!
-- sqlite NULL najmniejsza wartość --> w PG największa???
SELECT
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg;
-- pożądkujemy od najmniejsze wartości rocznego wynagrodzenia dla prac 'Data Analyst'

SELECT
    job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
ORDER BY 
    salary_year_avg DESC;
-- pożądkujemy od wartości największej do najmniejszej --> NULL czyli brak wartości jest większe co jest dziwne i trzeba filtrować!!!


/* kolejność komend
SELECT column1, column2, ...
FROM table_name 
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column1 [ASC|DESC]...
LIMIT number;
/*