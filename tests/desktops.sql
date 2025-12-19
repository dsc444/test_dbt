with

locations as (
        select * from {{ref('locations')}}
)

select
    your_column_name
from {{ ref('locations') }}
where your_column_name like '%desktops%'