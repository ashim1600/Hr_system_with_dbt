{{ config(materialized='view') }}

with base as (
  select
    department_name,
    count(*) as total_employees,
    count(*) filter (where term_date is not null) as terminated_employees
  from {{ ref('dim_employee') }}
  group by 1
)
select
  department_name,
  total_employees,
  terminated_employees,
  round(terminated_employees::numeric / nullif(total_employees, 0), 4) as attrition_rate
from base
order by attrition_rate desc