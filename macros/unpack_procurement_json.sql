{% macro unpack_procurement_json(data) %}

data:buyer::string buyer,
data:data_accessed::string data_accessed,
data:id::string id,
data:procurement_number::number procurement_number,
data:project_id::string project_id,
data:publish_date::string publish_date,
data:source::string source,
data:title::string title,
data:type::string type

{% endmacro %}