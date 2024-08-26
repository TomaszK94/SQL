-- CREATE TABLE 
-- Schemat
CREATE TABLE table_name (
    column_name datatype,
    column_name2 datatype,
    ...
);

-- Do uruchomienia
CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
);

SELECT *
FROM job_applied;

-- INSERT INTO --> wgryuwanie danych --> VALUES --> to co chcemy dodać
-- Schemat ogólny
INSERT INTO table_name (column_name, column_name2, ...)
VALUES (value1, value2, ...);

-- Do uruchomienia
INSERT INTO job_applied (
        job_id,
        application_sent_date,
        custom_resume,
        resume_file_name,
        cover_letter_sent,
        cover_letter_file_name,
        status)
VALUES (1,
        '2024-02-01',
        TRUE,
        'resume_01.pdf',
        TRUE,
        'cover_letter_01.pdf',
        'submitted'),
        (2,
        '2024-02-02',
        FALSE,
        'resume_02.pdf',
        FALSE,
        NULL,
        'interview scheduled'),
        (3,
        '2024-02-03',
        TRUE,
        'resume_03.pdf',
        TRUE,
        'cover_letter_03.pdf',
        'ghosted'),
        (4,
        '2024-02-04',
        TRUE,
        'resume_04.pdf',
        FALSE,
        NULL,
        'submitted'),
        (5,
        '2024-02-05',
        FALSE,
        'resume_05.pdf',
        TRUE,
        'cover_letter_05.pdf',
        'rejected');

-- UWAGA ABY WGRAĆ DANE TYLKO RAZ!!! --> bo będą się wgrywać za każdym uruchomieniem programu

SELECT *
FROM job_applied;

/*
ALTER TABLE --> edytowanie tabeli --> dodawanie, kasowanie, zmiana nazwy oraz zmiana typu danych kolumn w tabeli.
*/
-- schemat ogólny 
ALTER TABLE table_name
ADD column_name datatype  -- dodawanie kolumny
RENAME COLUMN column_name TO new_name  -- zmiana nazwy kolumny
ALTER COLUMN column_name TYPE new_data_type  -- zmiana typu danych kolumny
DROP COLUMN column_name  -- kasowanie kolumn


-- dodajemy nową kolumnę contact
ALTER TABLE job_applied
ADD contact VARCHAR(50);

SELECT *
FROM job_applied;

/*
UPDATE --> modyfikowanie danych w tabeli 
UPDATE --> używany do modyfikacji obecnych danych w danej tabeli
SET --> określamy, która kolumna i o jakie wartości ma być zaktualizowana
WHERE --> dajemy warunek, które wiersze mają być uaktualnione
*/
-- Schemat
UPDATE table_name
SET column_name = 'new_value'
WHERE condition;

-- dodajemy wartości do wcześniej dodanej kolumny
UPDATE job_applied
SET contact = 'Erlich Bachman'
WHERE job_id = 1;

UPDATE job_applied
SET contact = 'Dinesh Chugtai'
WHERE job_id = 2;

UPDATE job_applied
SET contact = 'Bertram Gilfoyle'
WHERE job_id = 3;

UPDATE job_applied
SET contact = 'Jian Yang'
WHERE job_id = 4;

UPDATE job_applied
SET contact = 'Big Head'
WHERE job_id = 5;



SELECT *
FROM job_applied;



/* 
ALTER TABLE ciąg dalszy --> zmieniamy nazwę kolumnie --> rename 
*/
-- Do uruchomienia
ALTER TABLE job_applied
RENAME COLUMN contact TO contact_name;


SELECT *
FROM job_applied;


/* 
ALTER TABLE ciąg dalszy --> zmieniamy typ danych kolumny 
zmieniamy z VARCHAR(50) na TEXT
*/
-- Do uruchomienia
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;

SELECT *
FROM job_applied;

-- Trzeba pamiętać, że jeśli mamy już wpisane dane i chcemy zmienić typ danych to nie możemy zmienić np str --> int 
/*
SET/CHANGE default value --> przypisuje wartośc domyślną do kolumny dla nowych wierszy jeśli wartości nie są określone
ALTER TABLE table_name
ALTER COLUMN column_name SET DEFAULT default_value;

DROP default value --> cofa wartość domyślną kolumn jeśli taka jest przypisana do kolumny
ALTER TABLE table_name
ALTER COLUMN coumn_name DROP DEFAULT;
*/


/* 
DROP COLUMN --> kasujemy daną kolumnę
*/

-- Schemat
ALTER TABLE table_name
DROP COLUMN column_name;

-- do uruchomienia 
ALTER TABLE job_applied
DROP COLUMN contact_name;

SELECT *
FROM job_applied;



/* 
DROP TABLE --> kasowanie całych tabel !!!
*/
-- Schemat
DROP TABLE table_name;

-- do uruchomienia
DROP TABLE job_applied;

SELECT *
FROM job_applied;

-- job_applied tabela nie istnieje --> aby przetestować poszczególne operację należy robić wszystko po kolei 