select 
    case
        when SUM(clicks) != 0 then round((SUM(spend)/SUM(clicks)), 2)
        else 0
    end as cost_per_click,
    channel
from {{ ref('int_unioned') }}
group by channel
order by cost_per_click desc