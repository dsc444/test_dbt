{% snapshot locations_snapshot %}

{{
    config(
        target_database='FIVETRAN2',
        target_schema='snapshots',
        unique_key='ad_id',
        strategy='check',
        check_cols='all'
    )
}}

select * from {{ source('fivetran_sheets', 'locations') }}


{% endsnapshot %}
