CREATE TABLE January_jobs AS 
SELECT *
FROM 
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 1;

CREATE TABLE February_jobs AS 
SELECT *
FROM 
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 2;

CREATE TABLE March_jobs AS 
SELECT *
FROM 
    job_postings_fact
WHERE
    EXTRACT(MONTH FROM job_posted_date) = 3;
