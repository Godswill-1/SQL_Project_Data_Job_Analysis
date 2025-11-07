SELECT 
    companies.name AS company_name,
    COUNT(job_postings.job_id) AS job_postings_count
FROM 
    job_postings_fact as job_postings 
JOIN company_dim as companies 
    ON job_postings.company_id = companies.company_id
WHERE 
    job_postings.job_health_insurance = TRUE
    AND EXTRACT(YEAR FROM job_postings.job_posted_date) = 2023
    AND EXTRACT(QUARTER FROM job_postings.job_posted_date) = 2
GROUP BY 
    company_name
ORDER BY 
    job_postings_count DESC;
