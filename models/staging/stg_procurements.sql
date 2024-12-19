select {{ unpack_procurement_json(data) }}
from {{ source("DBT_SCHEMA", "PROCUREMENT_12") }}
union all
select {{ unpack_procurement_json(data) }}
from {{ source("DBT_SCHEMA", "PROCUREMENT_34") }}
union all
select {{ unpack_procurement_json(data) }}
from {{ source("DBT_SCHEMA", "PROCUREMENT_56") }}
