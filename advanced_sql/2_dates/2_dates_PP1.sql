SELECT 
    job_schedule_type,
    avg(salary_year_avg) AS avg_yearly_salary,
    avg(salary_hour_avg) AS avg_hourly_salary
FROM
    job_postings_fact
WHERE
    job_posted_date > '2023-06-01'
GROUP BY 
    job_schedule_type