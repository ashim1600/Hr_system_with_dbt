{{ config(materialized='table') }}

select
  department_name,
  job_title,
  location_name,
  count(*) filter (where term_date is null) as active_headcount,
  count(*) filter (where term_date is not null) as terminated_count,
  avg(salary) filter (where term_date is null) as avg_active_salary,
  max(salary) as max_salary,
  min(salary) as min_salary
from {{ ref('dim_employee') }}
group by 1,2,3