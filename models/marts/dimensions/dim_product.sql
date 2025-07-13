{{ config(
    materialized='table',
    schema='marts'
)}}

SELECT
    product_id,
    product_name,
    product_category,
    brand,
    unit_price,
    dbt_valid_from AS valid_from,
    dbt_valid_to AS valid_to,
    CASE 
        WHEN dbt_valid_to IS NULL THEN 'Active' 
        ELSE 'Inactive' 
    END AS status    
FROM {{ ref('product_snapshot') }}
