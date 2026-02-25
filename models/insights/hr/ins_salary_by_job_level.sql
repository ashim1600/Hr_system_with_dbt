{{ config(materialized='view') }}

select
  job_level,

  count(*) filter (where term_date is null) as active_employees,

  round(avg(salary) filter (where term_date is null), 2) as avg_salary,

  round(
      (percentile_cont(0.5) within group (order by salary))::numeric,
      2
  ) as median_salary

from {{ ref('dim_employee') }}

group by 1
order by 1