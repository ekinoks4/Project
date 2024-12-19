{% macro unpack_bid_json(data) %}
    
    data:data_accessed::string data_accessed,
    data:procurement_number::number procurement_number,
    data:source::string source,
    data:supplier::string supplier,
    data:value::string value

{% endmacro %}