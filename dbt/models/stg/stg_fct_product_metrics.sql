{{ config(
    materialized='table',
    tags=['staging', 'facts']
) }}

with base_fact as (
    select
        product_id,
        brand_id,
        category_id,
        price_usd,
        value_price_usd,
        sale_price_usd,
        loves_count,
        rating,
        case when rating >=4.5 then true else false end as is_good_rating,
        reviews_count
    from 
        {{ ref('base_fct_product_snapshot') }}
),

base_categories as (
    select 
        category_id,
        primary_category 
    from 
        {{ ref('base_dim_product_categories') }}
),

base_brand as (
    select 
        brand_id,
        brand_name
    from 
        {{ ref('base_dim_brands') }}
),

base_products as (
    select 
        product_id,
        product_name,
        is_online_only,
        is_sephora_exclusive,
        is_limited_edition,
        is_new,
        is_out_of_stock
    from 
        {{ ref('base_dim_products') }}
)

select
    f.product_id,
    f.brand_id,
    b.brand_name,
    c.category_id,
    c.primary_category,
    f.price_usd,
    f.value_price_usd,
    f.sale_price_usd,
    f.loves_count,
    f.rating,
    f.is_good_rating,
    f.reviews_count,
    p.product_name,
    p.is_online_only,
    p.is_sephora_exclusive,
    p.is_limited_edition,
    p.is_new,
    p.is_out_of_stock
from 
    base_fact f
left join
    base_products p
    on f.product_id = p.product_id
left join 
    base_categories c
    on f.category_id = c.category_id
left join
    base_brand b
    on f.brand_id = b.brand_id