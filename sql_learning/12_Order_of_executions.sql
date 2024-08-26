/* ORDER OF EXECUTION of SQL QUERY

Full Order of Execution
1. FROM/JOIN
 - Specifies the tables to retrieve data from and how to join them.
2. WHERE 
 - Filters rows based on conditions. 
3. GROUP BY
 - Group rows share a property so aggregate functions can be applied.
4. HAVING 
 - Filters groups based on aggregate conditions (used after GROUP BY).
5. SELECT
 - Select specific coumns to display in the final result.
6. DISTINCT
 - Removees duplcate rows from the result set (applied after SELECT).
7. ORDER BY 
 - Sorts the result set based on specified columns/values.
8. LIMIT/OFFSET
 - Limits the number of rows returned, often used for pagination.


ORDER TO WRITE COMMANDS:
SELECT column1, column2, ...
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column1 [ASD|DESC]...
LIMIT number;

*/