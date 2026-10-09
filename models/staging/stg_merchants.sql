select merchant_id, merchant_name, category, state
from {{ source('raw', 'merchants') }}
