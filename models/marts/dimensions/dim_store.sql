{{ config(
    materialized='table',
    schema='marts'
)}}

SELECT
    store_id,
    store_name,
    city,
    manager_name,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to,
    CASE 
        WHEN dbt_valid_to IS NULL THEN 'Active' 
        ELSE 'Inactive' 
    END AS status
FROM {{ ref('store_snapshot') }}
