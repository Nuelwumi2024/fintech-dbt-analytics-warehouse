select
    txn_date,
    count(*)                                                        as txns,
    count(distinct customer_id)                                     as active_customers,
    {{ ngn_millions("case when status = 'success' then amount_ngn else 0 end") }} as success_volume_m_ngn,
    round(100.0 * avg(case when status = 'success' then 1 else 0 end), 2) as success_rate_pct,
    round(100.0 * avg(case when status = 'failed'  then 1 else 0 end), 2) as failure_rate_pct,
    sum(case when is_fraud then 1 else 0 end)                       as fraud_txns
from {{ ref('fct_transactions') }}
group by 1
