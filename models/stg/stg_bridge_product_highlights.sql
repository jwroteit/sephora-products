{{ config(
    materialized='table',
    tags=['staging', 'bridge']
) }}

with unpacked as (
    select
        product_id,
        highlight_name
    from 
        {{ ref('base_product_highlights_unpacked') }}
),

dim_highlights as (
    select
        highlight_id,
        highlight_name
    from 
        {{ ref('base_dim_product_highlights') }}
)

select distinct
    u.product_id,
    h.highlight_id
from 
    unpacked u
inner join 
    dim_highlights h
    on u.highlight_name = h.highlight_name