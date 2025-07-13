{% snapshot store_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='store_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}

select *
from {{ ref('stg_store_raw') }}

{% endsnapshot %}