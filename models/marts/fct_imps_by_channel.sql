select 
    SUM(impressions) as total_imp,
    channel
from {{ ref('int_unioned') }}
group by channel