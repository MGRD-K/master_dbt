with bike as(

    select
    start_statio_id as start_station_id,
    start_station_name,
    start_lat,
    start_lng
    from {{ ref('stage_bike') }}

    where ride_id != 'ride_id'
    
 qualify row_number() over (partition by start_statio_id order by start_statio_id desc  ) = 1
    
)

select * from bike