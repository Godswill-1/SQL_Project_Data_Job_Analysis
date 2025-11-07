SELECT
    count(job_id) AS number_of_jobs,
    CASE
        WHEN salary_year_avg > 90000 THEN 'High'
        WHEN salary_year_avg = 90000 THEN 'Standard'
        WHEN salary_year_avg < 90000 THEN 'Low' 
    ELSE 'No Data'
    END AS salary_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    salary_category
ORDER BY
    salary_category DESC
