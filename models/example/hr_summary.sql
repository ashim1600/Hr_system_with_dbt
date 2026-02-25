{{ config(materialized='view') }}

SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS avg_salary,
    MAX(salary) AS max_salary

FROM {{ ref('my_first_dbt_model') }}

GROUP BY department
ORDER BY total_employees DESC