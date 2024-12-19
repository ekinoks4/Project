select {{ unpack_bid_json(data) }}
from {{ source("DBT_SCHEMA", "BIDS_12") }}
union all
select {{ unpack_bid_json(data) }}
from {{ source("DBT_SCHEMA", "BIDS_34") }}
union all
select {{ unpack_bid_json(data) }}
from {{ source("DBT_SCHEMA", "BIDS_56") }}
