with cte as (
select 

to_timestamp(started_at) as started_at,
date(to_timestamp(started_at)) as date_strated_at,
hour(to_timestamp(started_at)) as hours_stredd_at,

{{ get_daytype('started_at')}}
as day_type,

{{ get_season('started_at')}}
 as Season_Of_Year,


from 

{{ ref('stage_bike') }}
--{{ source('demo', 'bike') }}
where ride_id != 'ride_id'
)

select * from cte