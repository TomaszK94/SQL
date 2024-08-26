/*
Wildcards --> używamy w WHERE
używamy je jako zamienniki w ciągu string ---> '%Data%' --> oznacza że przed słowem Data może być nieogarniczona liczba innych znaków tak samo jak i za 
_Data_ --> _ odpowiada tylko zamiennikowi dokładnie jednego znaku, nie więcej
WILDCARDS używamy z operatorem LIKE!!!
% --> zero, jeden, lub więcej znaków
_ --> tylko i wyłącznie jeden 
*/

SELECT
    job_id,
    job_title,
    job_title_short,
    job_location
FROM
    job_postings_fact
WHERE
	job_title LIKE '%Business%Analyst%'
-- znajdzie wszystkie kombinacje w których wystąpi --> ...Business...Analyst.... 

SELECT
    job_id,
    job_title,
    job_title_short,
    job_location
FROM
    job_postings_fact
WHERE
	job_title LIKE '%Business_Analyst%'
-- znajdzie wszystkie kombinacje w których wystąpi --> .....Business.Analyst.........--> pomiędzy _ będzie zazwyczaj w tym przypadku oznaczał spację