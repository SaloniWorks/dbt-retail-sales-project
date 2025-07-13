{{ config(
    materialized = 'view'
) }}

SELECT
  store_id,
  store_name,
  City AS city,
  manager_name,
  open_year,
  updated_at
FROM {{ source('Retail_Raw_Data', 'Store_Raw') }}