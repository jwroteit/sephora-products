{% macro clean_string_to_list(column_name) %}
    list_transform(
        string_split(regexp_replace({{ column_name }}, '\[|\]|\''|"', '', 'g'), ','),
        x -> trim(x)
    )
{% endmacro %}

{% macro unnest_string_list(column_name, alias_name='item_name') %}
    unnest({{ clean_string_to_list(column_name) }}) as t({{ alias_name }})
{% endmacro %}