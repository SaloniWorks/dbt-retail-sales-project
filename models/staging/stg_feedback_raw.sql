{{ config(
    materialized = 'view'
) }}

SELECT
  feedback_id,
  store_id,
  manager_name,
  feedback_date,
  rating,
  comments,
  updated_at
FROM {{ source('Retail_Raw_Data', 'Feedback_Raw') }}