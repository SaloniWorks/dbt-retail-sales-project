{{ config(
    materialized='table',
    schema='marts'
)}}

SELECT
    feedback_id,
    store_id,
    feedback_date,
    manager_name,
    rating,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to,
    CASE 
        WHEN dbt_valid_to IS NULL THEN 'Active' 
        ELSE 'Inactive' 
    END AS status
FROM {{ ref('feedback_snapshot') }}
