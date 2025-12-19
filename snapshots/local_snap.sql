{% snapshot locations_snapshot %}

{{
    config(
      target_database='FIVETRAN2', -- Where you want the history stored
      target_schema='snapshots',            -- A dedicated schema for history
      unique_key='id',                      -- The primary key of your sheet row
      strategy='check',                     -- Use 'check' for Google Sheets
      check_cols='all',                     -- Tracks changes in ANY column
    )
}}

select * from {{ source('fivetran_sheets', 'locations') }}

{% endsnapshot %}