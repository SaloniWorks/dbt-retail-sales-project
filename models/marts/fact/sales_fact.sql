{{ config(
    materialized='incremental',
    unique_key='transaction_id',
    schema='marts'
)}}

SELECT
    s.transaction_id,
    p.product_id,
    st.store_id,
    d.calendar_date AS transaction_date,
    s.quantity,
    s.quantity*p.unit_price AS total_price
FROM {{ ref('stg_sales_raw') }} s
LEFT JOIN {{ ref('dim_product') }} p
USING(product_id)
LEFT JOIN {{ ref('dim_store') }} st
USING(store_id)
LEFT JOIN {{ ref('dim_date') }} d
ON s.transaction_date = d.calendar_date

{% if is_incremental() %}
WHERE s.transaction_id NOT IN(
    SELECT transaction_id FROM {{ this }}
)
{% endif %}