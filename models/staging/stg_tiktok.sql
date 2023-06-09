select 
    `date`, 
    add_to_cart, 
    clicks, 
    0 as comments, 
    (add_to_cart + clicks + rt_installs + skan_app_install + registrations + video_views) as engagements, 
    impressions, 
    (rt_installs + skan_app_install) as installs, 
    0 as likes, 
    0 as link_clicks, 
    0 as post_click_conversions,
    0 as post_view_conversions,
    0 as posts,
    purchase,
    registrations,
    0 as revenue,
    0 as shares,
    spend,
    (conversions + skan_conversion) as total_conversions,
    video_views,
    cast(ad_id as string) as ad_id,
    cast(adgroup_id as string) as adset_id,
    cast(campaign_id as string) as campaign_id,
    channel,
    cast(null as string) as creative_id,
    cast(null as string) as placement_id

from {{ ref('src_ads_tiktok_ads_all_data') }}