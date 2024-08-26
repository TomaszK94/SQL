/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

-- Dla dodania trochę więcej wiarygodności --> dana umiejętność musi się pojawić przynajmniej w 50 ofertach pracy
SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary,
    COUNT(skills) AS total_job_offerts
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
HAVING 
    COUNT(skills) > 25
ORDER BY 
    avg_salary DESC
LIMIT 25;


-- Results Json 
[
  {
    "skills": "kafka",
    "avg_salary": "129999",
    "total_job_offerts": "40"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387",
    "total_job_offerts": "71"
  },
  {
    "skills": "scala",
    "avg_salary": "115480",
    "total_job_offerts": "59"
  },
  {
    "skills": "linux",
    "avg_salary": "114883",
    "total_job_offerts": "58"
  },
  {
    "skills": "confluence",
    "avg_salary": "114153",
    "total_job_offerts": "62"
  },
  {
    "skills": "pyspark",
    "avg_salary": "114058",
    "total_job_offerts": "49"
  },
  {
    "skills": "mongodb",
    "avg_salary": "113608",
    "total_job_offerts": "52"
  },
  {
    "skills": "gcp",
    "avg_salary": "113065",
    "total_job_offerts": "78"
  },
  {
    "skills": "spark",
    "avg_salary": "113002",
    "total_job_offerts": "187"
  },
  {
    "skills": "databricks",
    "avg_salary": "112881",
    "total_job_offerts": "102"
  },
  {
    "skills": "git",
    "avg_salary": "112250",
    "total_job_offerts": "74"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111578",
    "total_job_offerts": "241"
  },
  {
    "skills": "shell",
    "avg_salary": "111496",
    "total_job_offerts": "44"
  },
  {
    "skills": "unix",
    "avg_salary": "111123",
    "total_job_offerts": "37"
  },
  {
    "skills": "hadoop",
    "avg_salary": "110888",
    "total_job_offerts": "140"
  },
  {
    "skills": "pandas",
    "avg_salary": "110767",
    "total_job_offerts": "90"
  },
  {
    "skills": "php",
    "avg_salary": "109052",
    "total_job_offerts": "29"
  },
  {
    "skills": "nosql",
    "avg_salary": "108331",
    "total_job_offerts": "108"
  },
  {
    "skills": "express",
    "avg_salary": "108221",
    "total_job_offerts": "96"
  },
  {
    "skills": "redshift",
    "avg_salary": "107969",
    "total_job_offerts": "90"
  },
  {
    "skills": "jira",
    "avg_salary": "107931",
    "total_job_offerts": "145"
  },
  {
    "skills": "numpy",
    "avg_salary": "107398",
    "total_job_offerts": "54"
  },
  {
    "skills": "db2",
    "avg_salary": "107130",
    "total_job_offerts": "38"
  },
  {
    "skills": "postgresql",
    "avg_salary": "106853",
    "total_job_offerts": "44"
  },
  {
    "skills": "aws",
    "avg_salary": "106440",
    "total_job_offerts": "291"
  }
]