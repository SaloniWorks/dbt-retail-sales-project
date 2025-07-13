{{ config(
    materialized='table',
    schema='marts'
)}}

WITH dates AS(
    SELECT date AS calendar_date
    FROM unnest(generate_date_array('2024-01-01','2025-12-31', interval 1 day)) AS date
)

SELECT 
    calendar_date,
    EXTRACT(YEAR FROM calendar_date) AS year,
    EXTRACT(QUARTER FROM calendar_date) AS quarter,
    EXTRACT(MONTH FROM calendar_date) AS month,
    FORMAT_DATE('%B', calendar_date) AS month_name,
    FORMAT_DATE('%A', calendar_date) AS day_name,
    EXTRACT(DAYOFWEEK FROM calendar_date) AS day_of_week,
    EXTRACT(WEEK FROM calendar_date) AS week,
    CASE WHEN EXTRACT(DAYOFWEEK FROM calendar_date) in (1,7) then 'Weekend' ELSE 'Weekday' END AS is_weekend
FROM dates