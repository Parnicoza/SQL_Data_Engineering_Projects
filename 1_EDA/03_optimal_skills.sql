/*
Question: What are the most optimal skills to learn (high demand AND high paying)?
-Identify skills that are both in high demand and high paying
-Focus on remote job postings
-Why? Detects skills that offer job security (high demand) and financial benefits
 (high salaries), offering strategic insights for career development in data engineering
*/
SELECT
sd.skills,
ROUND(MEDIAN(jpf.salary_year_avg),1) AS median_salary,
COUNT(sd.skills) AS skill_count,
ROUND(LN(COUNT(sd.skills)),1) AS ln_demand_count,
Round((ln_demand_count * median_salary)/1_000_000,2) AS optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd ON jpf.job_id = sjd.job_id  
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
WHERE jpf.job_title_short = 'Data Engineer' AND job_work_from_home = TRUE AND jpf.salary_year_avg IS NOT NULL
GROUP BY sd.skills
HAVING skill_count >=100
ORDER BY optimal_score DESC
LIMIT 25 ;
