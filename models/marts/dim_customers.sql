with activity as (
    select
        customer_id,
        min(txn_date) as first_txn_date,
        max(txn_date) as last_txn_date,
        count(*)      as lifetime_txns,
        sum(case when status = 'success' then amount_ngn else 0 end) as lifetime_volume_ngn
    from {{ ref('stg_transactions') }}
    group by 1
)
select
    c.*,
    a.first_txn_date,
    a.last_txn_date,
    coalesce(a.lifetime_txns, 0)          as lifetime_txns,
    coalesce(a.lifetime_volume_ngn, 0)    as lifetime_volume_ngn,
    c.churn_date is not null              as is_churned
from {{ ref('stg_customers') }} c
left join activity a using (customer_id)
