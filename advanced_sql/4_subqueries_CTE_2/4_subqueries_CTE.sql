WITH january_jobs AS ( -- CTE definition starts here
	Select *
	From job_postings_fact
	WHERE EXtRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here

SELECT *
FROM january_jobs;