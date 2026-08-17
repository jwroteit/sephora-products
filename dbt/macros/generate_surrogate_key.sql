{% macro generate_surrogate_key(field_list) %}
    {%- if field_list is string -%}
        {%- set field_list = [field_list] -%}
    {%- endif -%}
    md5(
        concat_ws(
            '||',
            {%- for field in field_list %}
                coalesce(trim(cast({{ field }} as varchar)), 'N/A')
                {%- if not loop.last %},{% endif %}
            {%- endfor %}
        )
    )
{% endmacro %}