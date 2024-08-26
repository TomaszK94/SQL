/* 
Find the average salary and number of job postings for each skill 
*/

SELECT
	skills.skills AS skill_name,
    COUNT(skills_to_job.job_id) AS number_of_job_postings,
    AVG(job_postings.salary_year_avg) AS average_salary_for_skill
FROM
	skills_dim AS skills
LEFT JOIN skills_job_dim AS skills_to_job ON skills.skill_id = skills_to_job.skill_id
LEFT JOIN job_postings_fact AS job_postings ON skills_to_job.job_id = job_postings.job_id
GROUP BY
	skills.skills
HAVING
    AVG(job_postings.salary_year_avg) IS NOT NULL
ORDER BY 
	average_salary_for_skill DESC;

/*
- Write a query to list each unique skill from the skills_dim table.
- Count how many job postings mention each skill from the skills_job_dim table.
- Calculate the average yearly salary for job postings associated with each skill.
- Group the results by the skill name. 
- ORDER by the average salary.
*/
