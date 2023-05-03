select 
    `date`, 
    add_to_cart, 
    clicks, 
    comments, 
    0 as engagements, 
    impressions, 
    mobile_app_install as installs, 
    likes, 
    inline_link_clicks as link_clicks, 
    0 as post_click_conversions,
    0 as post_view_conversions,
    0 as posts,
    purchase,
    complete_registration as registrations,
    0 as revenue,
    shares,
    spend,
    0 as total_conversions,
    0 as video_views,
    cast(ad_id as string) as ad_id,
    cast(adset_id as string) as adset_id,
    cast(campaign_id as string) as campaign_id,
    channel,
    cast(creative_id as string) as creative_id,
    null as placement_id

from {{ ref('src_ads_creative_facebook_all_data') }}