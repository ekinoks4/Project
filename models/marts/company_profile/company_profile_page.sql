{{ config(materialized="table") }}

select
    supplier,
    title,
    bid_amount,
    currency,
    case when bid_ranking = 1 then true else false end is_winner_bid,
    buyer,
    type,
    source,
    procurement_number,
    publish_date
from {{ ref("procurements_with_bids") }}
where supplier is not null