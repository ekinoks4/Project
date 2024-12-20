{{ config(materialized="table") }}

select
    supplier,
    title,
    bid_amount,
    currency,
    case when bid_ranking = 1 then true else false end is_winner_bid,
    count(*) over (partition by supplier) total_number_of_bids,
    count(case when is_winner_bid then 1 else null end) over (
        partition by supplier
    ) total_number_of_winner_bids,
    buyer,
    type,
    source,
    procurement_number,
    publish_date
from {{ ref("procurements_with_bids") }}
where supplier is not null