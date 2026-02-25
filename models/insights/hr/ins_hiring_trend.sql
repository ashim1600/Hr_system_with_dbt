{{ config(materialized='view') }}

select
  date_trunc('month', hire_date) as hire_month,
  count(*) as hires
from {{ ref('dim_employee') }}
group by 1
order by 1