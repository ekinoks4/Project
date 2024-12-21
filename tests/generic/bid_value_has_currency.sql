{% test bid_value_has_currency(model) %}

    with
        validation as (

            select * from {{ model }} where not (value is null or value like '¥%')
        )

    select *
    from validation

{% endtest %}
