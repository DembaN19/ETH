{{ config(
    materialized='incremental',
    unique_key='transaction_hash',
    incremental_strategy='merge'
) }}

with eth_transactions_full as (
    select
        transaction_hash,
        block_number,
        block_timestamp,
        from_address,
        to_address,
        value_wei,
        gas_limit,
        gas_used,
        gas_price_wei,
        status,
        transaction_type,
        nonce,
        transaction_index
from {{ source('eth', 'eth_transactions') }} )


select * from eth_transactions_full

{% if is_incremental() %}

where block_timestamp >= (select coalesce(max(block_timestamp),'1900-01-01'::TIMESTAMP_NTZ) from {{ this }} )

{% endif %}