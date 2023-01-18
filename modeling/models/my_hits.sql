with source as (
      select * from {{ source('main', 'hits') }}
),

renamed as (
    select
        watchid as watch_id,
        eventtime as event_time,
        eventdate as event_date,
        clientip as client_ip,
        regionid as region_id,
        userid as user_id
    from source
)

select * from renamed
