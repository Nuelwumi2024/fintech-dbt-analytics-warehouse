select
    channel,
    txn_type,
    count(*)                                                         as txns,
    round(100.0 * avg(case when status = 'failed' then 1 else 0 end), 2) as failure_rate_pct,
    round(avg(amount_ngn), 2)                                        as avg_ticket_ngn,
    round(100.0 * avg(case when is_fraud then 1 else 0 end), 3)      as fraud_rate_pct
from {{ ref('fct_transactions') }}
group by 1, 2
