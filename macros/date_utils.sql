{% macro get_season(x) %}

case 
when
month(to_timestamp({{x}})) in (12,1,2) then 'Spring'
when month(to_timestamp({{x}})) in (3,4,5) then 'Summer'
else 'Autumn'
end

{%  endmacro%}

{% macro get_daytype(x) %}

case
  when dayname(to_timestamp({{x}})) in ('Sat','Sun')
  then 'Weekend' 
  else 'BusinessDay'
  end 


{% endmacro%}