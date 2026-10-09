select
    loan_id,
    customer_id,
    cast(disbursed_date as date)      as disbursed_date,
    principal_ngn,
    tenor_months,
    monthly_rate,
    cast(due_date as date)            as due_date,
    status,
    cast(first_missed_date as date)   as first_missed_date,
    amount_repaid_ngn
from {{ source('raw', 'loans') }}
