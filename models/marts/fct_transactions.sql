select
    t.transaction_id,
    t.customer_id,
    t.merchant_id,
    t.txn_at,
    t.txn_date,
    extract(hour from t.txn_at)   as txn_hour,
    t.txn_type,
    t.channel,
    t.amount_ngn,
    t.status,
    t.is_fraud,
    m.category                    as merchant_category
from {{ ref('stg_transactions') }} t
left join {{ ref('stg_merchants') }} m using (merchant_id)
