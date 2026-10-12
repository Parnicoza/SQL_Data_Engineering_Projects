/* 
Question: What are the most in-demand skills for data engineers ?
-Identifi the job postings 
-Focus on remote job postings 
-Why? Retrives the top 10 skills with the highest demand in the remote jobs proving insights into the most valuable skills for fata engineers
 */

SELECT 
sd.skills,
COUNT(jpf.*) AS demand_count
FROM job_postings_fact as jpf
INNER JOIN skills_job_dim as sjd
ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim as sd
ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer'
AND jpf. job_work_from_home = TRUE
GROUP BY sd.skillS
ORDER BY demand_count DESC
LIMIT 10;
