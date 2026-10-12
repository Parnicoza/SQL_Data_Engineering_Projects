SELECT
jpf.job_title_short,
sd.skill_id,
sd.skills,
COUNT(jpf.job_id)  AS job_count
From job_postings_fact as jpf
LEFT JOIN skills_job_dim as sjd
ON jpf.job_id=sjd.job_id
LEFT JOIN skills_dim as sd
ON sjd.skill_id=sd.skill_id
WHERE job_title_short LIKE '%Data%'
GROUP BY jpf.job_title_short, sd.skill_id , sd.skills
ORDER BY COUNT(jpf.job_id) DESC;