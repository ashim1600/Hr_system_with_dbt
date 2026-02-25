# HR System with dbt

This project models HR data in dbt using a simple seed dataset and produces staging, mart, and insight models for workforce analytics.

## What's Inside

- Seeds: CSV sources for employees, departments, jobs, and locations in `seeds/`.
- Staging models: typed/cleaned views in `models/staging/hr/`.
- Mart models: employee dimension and workforce fact in `models/marts/hr/`.
- Insight models: analytics views for attrition, hiring trend, and salary by level in `models/insights/hr/`.

## Model Highlights

- `stg_hr_employees`, `stg_hr_departments`, `stg_hr_jobs`, `stg_hr_locations`.
- `dim_employee`: enriched employee dimension.
- `fct_workforce`: headcount and salary stats by department, job, and location.
- `ins_attrition_by_department`: attrition rate by department.
- `ins_hiring_trend`: hires per month.
- `ins_salary_by_job_level`: active employee count and salary stats by level.

## Quickstart

1. Ensure dbt is installed for your warehouse (for Postgres: `pip install dbt-postgres`).
2. Create a dbt profile named `my_dbt_project` in your `~/.dbt/profiles.yml`.
3. Run the pipeline:

```bash
cd /Users/ashimsharma/Downloads/DBT_With_Postgres/my_dbt_project

dbt seed

dbt run

dbt test
```

## Common Commands

- Build only staging: `dbt run --select models/staging/hr`
- Build only marts: `dbt run --select models/marts/hr`
- Build only insights: `dbt run --select models/insights/hr`
- Clean artifacts: `dbt clean`

## Project Layout

- `models/staging/hr/`: staging views
- `models/marts/hr/`: dimensional and fact tables
- `models/insights/hr/`: analytics views
- `seeds/`: raw CSV inputs
- `tests/`: dbt tests (add as needed)
- `snapshots/`, `macros/`, `analyses/`: standard dbt folders

## License

See `LICENSE`.
