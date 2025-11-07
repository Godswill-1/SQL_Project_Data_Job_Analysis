/*
Identify the top 5 skills that are most frequency mentioned in job postings
Use a subquery to find the skill IDs with highest counts in the skills_job_dim table
Then join this result with the skills_dim table to get the skill names.
*/

WITH skill_job_count AS (
    SELECT 
        skill_id,
        count(*) AS skill_count
    FROM
        skills_job_dim
    GROUP BY
        skill_id
)

SELECT 
    skills_dim.skills AS skills,
    skill_job_count.skill_count 
FROM
    skills_dim
LEFT JOIN skill_job_count ON skill_job_count.skill_id = skills_dim.skill_id
ORDER BY 
        skill_count DESC
LIMIT 5 
