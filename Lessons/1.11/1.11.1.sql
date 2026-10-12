SELECT
 jpf.job_id,
 jpf.job_title,
 cd.name AS company_name,
 jpf.job_location,
 jpf.job_posted_date
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
ON jpf.company_id=cd.company_id
WHERE cd.company_id IS NOT NULL 
AND job_title_short = 'Data Engineer'
ORDER BY job_posted_date DESC ;