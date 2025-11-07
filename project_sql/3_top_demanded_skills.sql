/*
Question: What are the most in-demand skills for data analyst?
- Join job postings to inner join table similar to query 2
- identify the top 5 in-demand skills for a data analyst
- Focus on all job postings.
- Why? Retrieves the top 5 dkills with the highest demand in the job market,
- Providing insights into the most valuable skills for job seekers.
*/
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact AS jpf
WHERE
    job_title_short = 'Data Analyst' 
    AND job_work_from_home = TRUE
INNER JOIN skills_job_dim ON jpf.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id  
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5 