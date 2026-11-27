SELECT
      job_posted_date,
      company_id::VARCHAR,
      job_title_short,
      job_posted_date::DATE AS dt,
      CONCAT(company_id,'-',dt) AS coumpound_key
FROM job_postings_fact
LIMIT 10;