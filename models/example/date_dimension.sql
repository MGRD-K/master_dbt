with cte as (
select 
started_at,
to_timestamp(started_at) as started_at,
date(to_timestamp(started_at)) as date_strated_at,
hour(to_timestamp(started_at)) as hours_stredd_at,
case
  when dayname(to_timestamp(started_at)) in ('Sat','Sun')
  then 'Weekend' 
  else 'BusinessDay'
  end as day_type,

case 
when
month(to_timestamp(started_at)) in (12,1,2) then 'Spring'
when month(to_timestamp(started_at)) in (3,4,5) then 'Summer'
else 'Autumn'
end as Season_Of_Year

from 
{{ source('demo', 'bike') }}
where ride_id != 'ride_id'
)

select * from cte