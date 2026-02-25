{{ config(materialized='view') }}

select
  employee_id::int,
  first_name,
  last_name,
  gender,

  hire_date,

  case
      when term_date is null then null
      when term_date::text in ('', '""') then null
      else term_date::date
  end as term_date,

  department_id::int,
  job_id::int,
  location_id::int,

  case
      when manager_id is null then null
      when manager_id::text in ('', '""') then null
      else manager_id::int
  end as manager_id,

  salary::numeric as salary

from {{ ref('hr_employees') }}