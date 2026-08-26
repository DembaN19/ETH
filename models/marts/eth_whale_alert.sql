select
    transaction_hash,
    block_number,
    block_timestamp,
    from_address,
    to_address,
    value_wei,
    value_wei / 1e18 as value_eth
from {{ ref('stg_eth_succeeded') }}
where value_wei >= 1e20
order by block_timestamp desc