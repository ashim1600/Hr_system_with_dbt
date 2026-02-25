{{ config(materialized='view') }}

select
  department_id::int,
  department_name
from {{ ref('hr_departments') }}