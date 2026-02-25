{{ config(materialized='view') }}

select
  job_id::int,
  job_title,
  job_level::int
from {{ ref('hr_jobs') }}