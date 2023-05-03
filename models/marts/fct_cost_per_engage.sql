select 
    case
        when SUM(engagements) != 0 then round((SUM(spend)/SUM(engagements)), 2)
        else 0
    end as cost_per_engage,
    channel
from {{ ref('int_unioned') }}
group by channel