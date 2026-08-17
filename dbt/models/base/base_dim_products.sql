{{ config(
    materialized='view',
    tags=['base', 'products']
) }}

select
    distinct product_id,
    {{ clean_string('product_name') }} as product_name,
    {{ clean_string('size') }} as product_size,
    {{ clean_string('variation_type') }} as product_variation_type,
    {{ clean_string('variation_value') }} as product_variation_value,
    {{ clean_string('variation_desc') }} as product_variation_desc,
    cast(limited_edition as boolean) as is_limited_edition,
    cast(new as boolean) as is_new,
    cast(online_only as boolean) as is_online_only,
    cast(out_of_stock as boolean) as is_out_of_stock,
    cast(sephora_exclusive as boolean) as is_sephora_exclusive
from 
    {{ source('main', 'products') }}