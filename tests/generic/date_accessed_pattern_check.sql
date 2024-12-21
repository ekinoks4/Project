{% test date_accessed_pattern_check(model) %}

    with
        validation as (

            select *
            from {{ model }}
            where
                not (
                    regexp_like(
                        date_accessed, '[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])'
                    )
                )
        )

    select *
    from validation

{% endtest %}
