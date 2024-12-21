{{ config(materialized="table") }}

select
    source,
    procurement_number,
    title,
    publish_date,
    buyer,
    count(supplier) number_of_bids,
    max_by(supplier, bid_amount) winner_supplier,
    max(bid_amount) winner_bid_amount,
    currency,
    type
from {{ ref("procurements_with_bids") }}
group by source, procurement_number, title, publish_date, buyer, currency, type
