with 
    cost_per_click as (
        select * from {{ ref('fct_cost_per_click') }}
    ),
    cost_per_conv as (
        select * from {{ ref('fct_cost_per_conv') }} 
    ),
    cost_per_engage as (
        select * from {{ ref('fct_cost_per_engage') }}
    ),
    imps_by_channel as (
        select * from {{ ref('fct_imps_by_channel') }}
    )
select * from cost_per_click
join cost_per_conv using (channel)
join cost_per_engage using (channel)
join imps_by_channel using (channel)
