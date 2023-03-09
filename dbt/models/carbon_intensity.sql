with source as (
    select * from {{ ref("carbon_intensity__extract") }}
)

select
    *,
    avg(forecast)
        over (order by (select null)) as average_forecast,
    forecast / average_forecast as relative_intensity
from
    source
