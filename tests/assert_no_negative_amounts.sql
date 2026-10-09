-- singular test: returns offending rows, so the test fails if any exist
select transaction_id, amount_ngn from {{ ref('fct_transactions') }} where amount_ngn <= 0
