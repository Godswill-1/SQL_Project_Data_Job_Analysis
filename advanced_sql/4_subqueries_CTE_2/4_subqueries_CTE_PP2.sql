/*
Determine the size category ('Small'), ('Medium'), ('Large') for each company by first identifying the number of job postings they have
Use a subquery to calculate the total job postings per company
A company is considered 'Small' if it has less than 10 job postings, 'Medium' if the number of job postings is between 10 and 50, and 'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classifying them based on size
*/

WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS company_count  
    FROM 
        job_postings_fact
    GROUP BY
        company_id
)

SELECT
    c.company_id,
    c.name AS company_name,
    CASE 
        WHEN company_count < 10 THEN 'Small'
        WHEN company_count BETWEEN 10 and 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size
FROM
    company_dim AS c 
LEFT JOIN company_job_count AS cjc ON c.company_id = cjc.company_id
ORDER BY
    company_name