{{ config(materialized="table") }}

with
    procurements as (
        select
            buyer,
            id procurement_id,
            procurement_number,
            project_id,
            publish_date,
            source,
            substr(title, regexp_instr(title, '[a-zA-Z]', 1), length(title)) title,
            type
        from {{ ref("stg_procurements") }}
        where title is not null
    ),

    bids as (
        select
            procurement_number,
            source,
            supplier,
            substr(value, 2, length(value))::float bid_amount,
            substr(value, 1, 1) currency,
            row_number() over (
                partition by procurement_number, source order by bid_amount desc
            ) bid_ranking
        from {{ ref("stg_bids") }}
        where supplier is not null
        and value is not null
    )

select
    procurements.buyer,
    procurements.procurement_id,
    procurements.procurement_number,
    procurements.project_id,
    procurements.publish_date,
    procurements.source,
    procurements.title,
    procurements.type,
    bids.supplier,
    bids.bid_amount,
    bids.currency,
    bid_ranking
from procurements
left join
    bids
    on procurements.source = bids.source
    and procurements.procurement_number = bids.procurement_number