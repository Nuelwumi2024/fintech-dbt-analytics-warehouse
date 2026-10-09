select
    transaction_id,
    customer_id,
    merchant_id,
    cast(txn_timestamp as timestamp)  as txn_at,
    cast(txn_timestamp as date)       as txn_date,
    txn_type,
    channel,
    cast(amount_ngn as double)        as amount_ngn,
    status,
    cast(is_fraud as boolean)         as is_fraud
from {{ source('raw', 'transactions') }}
