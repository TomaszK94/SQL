-- https://lukeb.co/sql_invoices_db --> baza danych !!! 


SELECT 
	project_id,
    -- hours_spent, 
    -- hours_rate AS rate_original,
    SUM(hours_spent * hours_rate) AS project_orignal_cost,
    -- hours_spent * hours_rate AS earning_basic, -- test
    -- hours_rate + 5 AS rate_hike,
    sum(hours_spent * (hours_rate + 5)) AS projec_projected_cost
    -- (hours_rate + 5) * hours_spent AS earning_rised  -- test
FROM
	invoices_fact
GROUP BY
	project_id


/* 
- Calculate the total earnings per project. (hours_spent * hours_rate) --> SUM
- Calculate a scenario where the hourly rate increases by $5. --> SUM
*/