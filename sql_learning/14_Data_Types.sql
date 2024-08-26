/*
Data Types:
INT - liczby całkowite --> -2.147.483.648 do 2.147.483.647
VARCHAR(n) --> przechowuje str z ograniczną długością wyrażenia (n) --> (n) maksymalnie 255 ?
        VARCHAR(10) --> 'Hello'
TEXT - string z nieograniczoną długością 'Hello, World'
BOOLEAN - TRUE/FALSE --> 0/1 albo też NULL
DATE --> przechowuję datę w formacie rok-miesiąc-dzień ---> 2024-08-23
TIMESTAMP --> przechowuję datę w formacie rok-miesiąc-dzień godziny-minuty-sec bez stref czasowych ---> 2024-08-23 21:20:10
TIMESTAM WITH TIME ZONE --> to samo co TIMESTAMP tylko dodatkowo mamy strefę czasową --> rok-miesiąc-dzień godziny-minuty-sec-strefa czasowa ---> 2024-08-23 21:20:10+00:00
NUMERIC(precision, scale) - liczby rzeczywiste --> możemy określić parametry --> 
        precision -> liczba cyfr, która ma być przechowywana
        scale --> liczba cyfr po przecinku 
        NUMERIC(6,3) --> 111.111 
*/

