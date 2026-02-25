{{ config(materialized='view') }}

select
  location_id::int,
  location_name,
  country
from {{ ref('hr_locations') }}