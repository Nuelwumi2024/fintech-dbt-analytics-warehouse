select
    customer_id,
    cast(signup_date as date)  as signup_date,
    state,
    acquisition_channel,
    kyc_tier,
    age,
    cast(churn_date as date)   as churn_date
from {{ source('raw', 'customers') }}
