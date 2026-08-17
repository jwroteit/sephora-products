{{ config(
    materialized='view',
    tags=['base', 'brands']
) }}

select distinct
    {{ generate_surrogate_key([clean_string('brand_name')]) }} as brand_id,
    {{ clean_string('brand_name') }} as brand_name
from 
    {{ source('main', 'products') }}
where
    brand_name is not null