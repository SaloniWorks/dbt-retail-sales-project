{% snapshot feedback_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='feedback_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select *
from {{ ref('stg_feedback_raw') }}

{% endsnapshot %}