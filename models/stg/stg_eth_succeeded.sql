{{ config(
    materialized='incremental',
    unique_key='transaction_hash',
    incremental_strategy='merge'
) }}

select *
from {{ ref ('stg_eth') }}
where status = 1