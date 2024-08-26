/*
+ ---> 
- --->
* --->
/ --->
% ---> reszta z dzielenia

operatory możemy używać zarówno w SELECT, WHERE, ORDER BY i innych....

Programy nie będą działać brak bazy danych do sprawdzenia na poniższej bazie danych na stronie podanej poniżej !!!
https://lukeb.co/sql_invoices_db
*/


SELECT 
	project_company,
    nerd_id,
    nerd_role,
    hours_spent,
    hours_rate AS rate_original,
    hours_rate - 5 AS rate_drop,
    hours_rate + 5 AS rate_hike,
    (hours_rate + 5) * hours_spent AS project_total
FROM 
	invoices_fact
WHERE 
	-- rate_hike * hours_spent > 1000 --> to samo co niżej bo jest zdefiniowane w select
	project_total > 1000
ORDER BY 
	project_total;

-- project_total(after hike) = rate_hike * hours_spent
/*
tworzymy nowa kolumnę w SELECT, którą jest stawka godzinowa + 5$ oraz stawka godzinowa - 5$ --> tworzy nową kolumnę w której do wartości hours_rate dodawane/odejmowane jest 5$
tworzymy nową kolumne w SELECT, która jest odpowiedzialna za policzenie całkowietej wartości projektu po podwyżce --> nowa kolumna z ceną za godzinę + 5$ pomnożona razy ilość wymaganych godzin
szukamy tylko projektów których koszt przekracza 1000$
sortujemy po wartości projetków od najmniejszej 
*/


/*
Wyszukanie projektów, w których wymagana liczba godzin do wykonania jest pomiędzy 8 a 16 godzin, a następnie wygenerowanie tylko tych w których będziemy musieli robić nadgodziny --> 
czas pracy nię bedzie podzielny bez reszty przez 8....
*/
SELECT
	activity_id,
    hours_spent,
    hours_spent % 8 AS extra_hours
FROM
	invoices_fact
WHERE 
	(hours_spent BETWEEN 8 AND 16) AND
    extra_hours > 0
ORDER BY 
	hours_spent;

