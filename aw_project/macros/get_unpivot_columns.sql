{% macro get_unpivot_columns(seed_name, exclude=[]) %}
    {% set exclude_set = exclude | map('lower') | list %}

    {% if execute %}
        {% set columns = adapter.get_columns_in_relation(ref(seed_name)) %}
        {% set column_names = columns | map(attribute='name') | list %}
        {% set filtered = [] %}
        {% for col in column_names %}
            {% if col.lower() not in exclude_set %}
                {% do filtered.append(col) %}
            {% endif %}
        {% endfor %}
        {{ return(filtered) }}
    {% endif %}
{% endmacro %}