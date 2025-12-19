{{ config (
    materialized = 'table'
)}}

with locations as (

    select * from {{locations}}

),

end_table as (

    select * from {{end_table}}

),

final as (

    select
        e.AD_id as ad_id,
        e.Device,
        l.Sale_Amount,
        l.Cost,
        l.Clicks
    from end_table as e
    left join locations as l
        on e.AD_id = l.AD_id
)

select * from final