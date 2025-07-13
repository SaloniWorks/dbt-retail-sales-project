{{ config(
    materialized = 'view'
) }}

SELECT
  transaction_id,
  transaction_date,
  store_id,
  product_id,
  quantity,
  updated_at
FROM {{ source('Retail_Raw_Data', 'Sales_Raw') }}