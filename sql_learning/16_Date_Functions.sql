/*
Date Functions in SQL - used to perform operations on date and time values

::DATE ==> Converts to a date format by removing the time portion
AT TIME ZONE ==> Converts a timestamp to a specified time zone
EXTRACT ==> Gets specific date parts (year, month, day)
*/

SELECT
    job_posted_date
FROM
    job_postings_fact
LIMIT 10;
-- Dane w postaci TIMESTAMP

/* 
::DATE

SELECT 
    timestamp_column::DATE AS date_column
FROM
    table_name;

:: --> służy do zmiany typów danych z jednego data type na drugi. Może być używany w innych przypadkach nie tylko Dacie
SELECT '2023-02-19'::DATE, '123'::INTEGER, 'True'::BOOLEAN, '3.14'::REAL;

::DATE --> przekształci coś na Data format
- Data format rok-miesiąc-dzień --> 2024-08-24
- Timestamp format rok-miesiąc-dzień godziny-minuty-sec --> 2024-08-24 00:25:15
*/

SELECT '2024-08-24'; -- string

SELECT '2024-08-24'::DATE;  -- zmienione na DATE

SELECT
    '2024-08-24'::DATE,
    '123'::INTEGER,
    'TRUE'::BOOLEAN,
    '3.14'::REAL;

-- przykłady 

-- wracamy do naszej bazy danych
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM
    job_postings_fact
-- data z godzinami 


SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM
    job_postings_fact
-- sama data bez godzin


/*
AT TIME ZONE --> zmienia timestamps na timestamps z strefą czasową
Może być użyty zarówno na timestamp z lub bez informacji o strefie czasowej 
TIMESTAMP --> 2024-08-24 00:42:20
TIMESTAMP WITH TIME ZONE --> 2024-08-24 00:42:20+00:00
*/

-- w naszej bazie data jest w postaci TIMESTAMP bez strefy czasowej 
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM
    job_postings_fact
LIMIT 5;

/* 
ZMIANA STREFY CZASOWEJ GDY JEST JUŻ JAKAŚ ZDEFINIOWANA np była UTC +0
SELECT 
    column_name AT TIME ZONE 'EST' -- zmiana na czas EST to -5 
FROM
    table_name

ZMIANA STREFY CZASOWEJ GDY NIE JEST ZDEFINIOWANA ŻADNA WCZEŚNIEJ --> ustawiamy jakby była wcześniej UTC czyli +0 a następnie zmieniamy na tą co chcemy
SELECT
    column_name AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM
    table_name
*/

--powrót do naszej bazy danych
SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date
FROM
    job_postings_fact
LIMIT 5;
-- godzina zmieniła się o 5h bo taka jest różnica pomiędzy strefami z 17:46 --> 12:46


/*
EXTRACT - wyciągnięcie danego składnika daty z całej daty --> np wyciągnięcie tylko miesiąca/roku
SELECT 
    EXTRACT(MONTH FROM column_name) AS column_month
FROM
    table_name
*/

SELECT
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,  -- nowa kolumna tylko z miesiącami 
    EXTRACT(YEAR FROM job_posted_date) AS date_year -- nowa kolumna tylko z rokiem 
FROM
    job_postings_fact
LIMIT 5;

-- zadanie sprawdzenie ile ofert pracy dla 'Data Analyst' zostało wypuszczone w danym miesiącu 
SELECT
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM
    job_postings_fact
WHERE 
    job_title_short = 'Data Analyst'
GROUP BY 
    month
ORDER BY
    job_posted_count DESC;


