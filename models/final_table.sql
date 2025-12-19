{{ config (
    materialized = 'table'
)}}

with locations_source as (
    -- Use source() for raw Fivetran data
    select * from {{ source('fivetran_sheets', 'locations') }}
),

-- Note: If 'end_table' is another file in your models folder, use ref()
-- If it's another source, use source(). 
-- I'll assume it's a source for now:
end_table_source as (
    select * from {{ source('fivetran_sheets', 'end_table') }}
),

final as (
    select
        l.AD_id as ad_id,
        l.Device,
        e.Sale_Amount,
        e.Cost,
        e.Clicks
    from end_table_source as e
    left join locations_source as l
        on e.AD_id = l.AD_id
)

select * from final