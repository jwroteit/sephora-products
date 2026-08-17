{{ config(
    materialized='table',
    tags=['marts', 'facts']
) }}


select 
    * 
from 
    {{ ref('stg_fct_product_metrics') }}