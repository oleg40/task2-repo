select 
    case
        when SUM(total_conversions) != 0 then round((SUM(spend)/SUM(total_conversions)), 2)
        else 0
    end as cost_per_conv,
    channel
from {{ ref('int_unioned') }}
group by channel
order by cost_per_conv desc