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

``` Python
fig, ax = plt.subplots(2, 1, figsize=(10, 10), facecolor="black")
sns.despine()

palette= sns.color_palette("YlOrRd", n_colors=10)
sns.barplot(data=df_1, x="salary_year_avg", y="job_title", ax=ax[0], hue="salary_year_avg", palette=palette, legend=False)

ax[0].grid(axis="x", color="gray", linestyle="--", linewidth=0.5, alpha=0.7, zorder=0)
ax[0].set_title(" ", pad=20)
ax[0].set_ylabel("")
ax[0].set_xlabel("")
ax[0].xaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: f"${int(x/1000)}K"))

ax[0].set_facecolor("black")
ax[0].tick_params(axis='x', colors='white', labelsize=10)  
ax[0].tick_params(axis='y', colors='white', labelsize=10)  

fig.text(0.5, 0.97, "Top 10 highest-paying Data Analyst roles that are available remotely", color='white', fontweight='bold', ha='center', fontsize=14)


palette1= sns.color_palette("YlGnBu", n_colors=10)
sns.barplot(data=df_2, x="salary_year_avg", y="company_name", ax=ax[1], hue="salary_year_avg", palette=palette1, legend=False)

ax[1].grid(axis="x", color="gray", linestyle="--", linewidth=0.5, alpha=0.7, zorder=0)
ax[1].set_title(" ", pad=20)
ax[1].set_ylabel("")
ax[1].set_xlabel("Yearly Salary (USD)", color="white", fontsize=12, labelpad=15)
ax[1].set_xlim(ax[0].get_xlim())
ax[1].xaxis.set_major_formatter(plt.FuncFormatter(lambda x, _: f"${int(x/1000)}K"))

ax[1].set_facecolor("black")
ax[1].tick_params(axis='x', colors='white', labelsize=10)  
ax[1].tick_params(axis='y', colors='white', labelsize=10)  

fig.text(0.5, 0.495, "Top 10 Highest Paid Company for Data Analysts (remotely)", color='white', fontweight='bold', ha='center', fontsize=14)


fig.tight_layout()
plt.show()
```
![Top Paying Jobs](Visualization/1_top_paying_jobs.png)
*Bar graph visualizing the salary for the top 10 salaries for data analysts (remotely)*

Full code to Visualization available here: 
[Top Paying Data Analyst Jobs Visualization](/Graphs/1_top_paying_jobs.ipynb)

### 2. Skills for Top Paying Jobs

### 3. In-Demand Skills for Data Analysts

### 4. Skills Based on Salary

### 5. Most Optimal Skills to Learn

# Conclusions

### Insights 

### Closing Thoughts 