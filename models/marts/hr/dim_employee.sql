{{ config(materialized='table') }}

select
  e.employee_id,
  e.first_name,
  e.last_name,
  e.gender,
  e.hire_date,
  e.term_date,
  e.manager_id,
  d.department_name,
  j.job_title,
  j.job_level,
  l.location_name,
  l.country,
  e.salary
from {{ ref('stg_hr_employees') }} e
left join {{ ref('stg_hr_departments') }} d using (department_id)
left join {{ ref('stg_hr_jobs') }} j using (job_id)
left join {{ ref('stg_hr_locations') }} l using (location_id)