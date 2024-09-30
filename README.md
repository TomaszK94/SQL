# Introduction

📊 Explore the data job market! This project focuses on data analyst roles, highlighting 💰 the highest-paying positions, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 All SQL queries available here: [project_sql folder](/sql_project/).

# Background

### The questions that were intended to be answered through this project:
1. What are the top-paying data analyst jobs?
2. What skills are required for these top-paying jobs?
3. What skills are most in demand for data analysts?
4. Which skills are associated with higher salaries?
5. What are the most optimal skills to learn?

# Tools Used

- **SQL:** Querying, managing, and manipulating data in relational database systems.
- **PostgreSQL:** Managing, storing, and querying structured data efficiently in relational databases.
- **Visual Studio Code:** Code editor for writing, editing various programming languages and scripts.
- **Git & GitHub:** Version control and collaborative development, allowing users to track changes and share code efficiently.
- **Python (Pandas, Matplotlib, Seaborn):** Visualization.

# The Analysis

### 1. Top Paying Data Analyst Jobs

To identify the highest-paying positions, data analyst roles were filtered by average annual salary and location, with a focus on remote job opportunities. This query highlights the top-paying prospects in the field.

``` SQL
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10;
```
### 2. Skills for Top Paying Jobs

### 3. In-Demand Skills for Data Analysts

### 4. Skills Based on Salary

### 5. Most Optimal Skills to Learn

# Conclusions

### Insights 

### Closing Thoughts 