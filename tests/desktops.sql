-- dbt will run this and fail if any rows are returned
select
    Device
from {{ source('fivetran_sheets', 'locations') }}
where lower(Device) like '%desktops%'