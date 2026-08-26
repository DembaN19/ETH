with eth_transactions_full as (
    select
        transaction_hash,
        block_number,
        block_timestamp,
        from_address,
        to_address,
        value as value_wei,
        gas as gas_limit,
        receipt_gas_used as gas_used,
        receipt_effective_gas_price as gas_price_wei,
        receipt_status as status,
        transaction_type,
        nonce,
        transaction_index
from {{ source('eth', 'eth_transactions') }} )

select * from eth_transactions_full