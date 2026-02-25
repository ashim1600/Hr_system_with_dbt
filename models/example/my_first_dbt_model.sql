{{ config(materialized='table') }}

WITH source_data AS (

    SELECT
        1 AS employee_id,
        'Ashim' AS first_name,
        'Sharma' AS last_name,
        'IT' AS department,
        60000 AS salary

    UNION ALL

    SELECT
        2,
        'Rahul',
        'Verma',
        'HR',
        50000

    UNION ALL

    SELECT
        3,
        'Neha',
        'Singh',
        'Finance',
        70000

)

SELECT *
FROM source_data