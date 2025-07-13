SELECT *
FROM {{ ref('dim_manager_feedback') }}
WHERE NOT (
    (rating BETWEEN 1 AND 5)
    OR rating IS NULL
)