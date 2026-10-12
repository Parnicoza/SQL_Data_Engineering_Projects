SELECT 
 jpf.job_id,
 jpf.job_title,
 sd.skills,
 jpf.job_country
FROM job_postings_fact AS jpf
LEFT JOIN skills_job_dim AS sjd
ON jpf.job_id=sjd.job_id 
Left JOIN skills_dim AS sd
ON sjd.skill_id=sd.skill_id
WHERE jpf.job_title_short='Data Engineer'
AND jpf.job_Country='United States'
AND jpf.job_health_insurance IS NOT NULL 
ORDER BY job_id DESC ;