/*
SQL JOINs:

LEFT JOIN --> zbiór A oraz B --> 
Przy LEFT JOIN --> wchodzi cały zbiór A oraz kawałek zbioru B, który ma cześć wspólną z A --> PRIMARY/FOREIGN KEY np company_id --> cześć A ma wartości 1,2,3,4,5 --> B ma wartości 1,2,3,4,5,6,7,8... -->
ściągnięte zostaną dane tylko przypisane wartościom 1,2,3,4,5 bo reszta nie należy do A.
*/
SELECT
	job_postings.job_id,
    job_postings.job_title_short, 
    job_postings.company_id,  -- to samo id co z drugiej tabeli
    companies.company_id,     -- to samo id co z drugiej tabeli
    companies.name            -- dzięki joinowi możemy wykorzystać kolumnę z innej tabeli, która będzie ściśle połączona z naszą główną tabelą
FROM
	job_postings_fact AS job_postings 
LEFT JOIN company_dim AS companies  -- określamy rodzaj joina oraz którą tabelę chcemy połączyć
	ON job_postings.company_id = companies.company_id  -- określamy po czym łączymy dwie tabele --> PRIMARY KEY / FOREIGN KEY
ORDER BY 
    job_id;

/*
RIGHT JOIN --> zbiór A oraz B --> 
Przy RIGHT JOIN --> wchodzi cały zbiór B oraz kawałek zbioru A, który ma cześć wspólną z B --> PRIMARY/FOREIGN KEY np company_id --> cześć B ma wartości 1,2,3,4,5 --> A ma wartości 1,2,3,4,5,6,7,8... -->
ściągnięte zostaną dane tylko przypisane wartościom 1,2,3,4,5 bo reszta nie należy do B.
Robi to samo co LEFT JOIN tylko główną tabelą jest ta, która dodaliśmy a nie pierwotnie założyliśmy. 
Wykorzystywany w zależności od wymagań oraz zawartości tabel. W naszym przykładzie LEFT oraz RIGHT zadziała tak samo. 
*/
SELECT
	job_postings.job_id,
    job_postings.job_title_short, 
    job_postings.company_id,  -- to samo id co z drugiej tabeli
    companies.company_id,     -- to samo id co z drugiej tabeli
    companies.name            -- dzięki joinowi możemy wykorzystać kolumnę z innej tabeli, która będzie ściśle połączona z naszą główną tabelą
FROM
	job_postings_fact AS job_postings 
RIGHT JOIN company_dim AS companies  -- określamy rodzaj joina oraz którą tabelę chcemy połączyć
	ON job_postings.company_id = companies.company_id  -- określamy po czym łączymy dwie tabele --> PRIMARY KEY / FOREIGN KEY
ORDER BY 
    job_id;

/*
INNER JOIN --> zbiór A oraz B --> 
Przy INNER JOIN --> wchodzi wyłącznie cześć wspólna zbioru A oraz zbioru B --> PRIMARY/FOREIGN KEY np company_id --> cześć B ma wartości 1,3,5 --> A ma wartości 1,2,3,4 -->
ściągnięte zostaną dane tylko przypisane wartościom 1,3 bo te są w cześci wspólnej obu zbiorów.
*/

SELECT
	job_postings.job_id,
    job_postings.job_title_short,
    skills_to_job.skill_id,
    skills.skills
FROM
	job_postings_fact AS job_postings 
INNER JOIN skills_job_dim AS skills_to_job ON job_postings.job_id = skills_to_job.job_id  
INNER JOIN skills_dim AS skills ON skills_to_job.skill_id = skills.skill_id                     -- można dodawać po kolei JOINY do świeżo dodanej tabeli, trzeba tylko pamiętać o kolejności 
ORDER BY 
    job_id;

-- job_id numer 15 i 16 nie występuje, w któreś z tabel więc go nie ma w tabeli zbiorczej po użyciu JOINA
-- prawdopodobnie do ofert 15 i 16 nie przypisano żadnych wymaganych umiejętności skill_id --> nie ma ich w tabeli skills_job_dim


/*
FULL OUTER JOIN --> zbiór A oraz B --> 
Przy FULL OUTER JOIN --> wynikiem tego połączenia jest suma zbiorów A oraz B --> wydostajemy wszystkie składniki zbioru A oraz B nie zależnie od części wspólnych
Żadko stosowany w analizowaniu danych 
*/