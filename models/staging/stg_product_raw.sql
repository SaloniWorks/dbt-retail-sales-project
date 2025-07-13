{{ config(
    materialized = 'view'
) }}

SELECT
  product_id,
  product_name,
  product_category,
  brand,
  CAST(unit_price AS NUMERIC) AS unit_price,
  updated_at
FROM {{ source('Retail_Raw_Data', 'Product_Raw') }}