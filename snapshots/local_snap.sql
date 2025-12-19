{% snapshot locations_snapshot %}

{{
    config(
        target_database='FIVETRAN2',
        target_schema='snapshots',
        unique_key='id',
        strategy='check',
        check_cols='all'
    )
}}

select * from {{ source('fivetran_sheets', 'locations') }}

{% endsnapshot %}