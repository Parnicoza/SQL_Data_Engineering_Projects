/*
Question: What are the highest-paying skills for data engineers?
-Identify the top skills by average salary
-Focus on remote job postings
-Why? Reveals which skills correlate with the highest pay in the remote job market,
 providing insights into which skills are most valuable for data engineers seeking remote work
*/
SELECT
     sd.skills,
     MEDIAN(jpf.salary_year_avg) AS median_salary,
     COUNT(sd.skills) AS skill_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id  
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer' AND job_work_from_home = TRUE
GROUP BY sd.skills
ORDER BY median_salary DESC
LIMIT 25;