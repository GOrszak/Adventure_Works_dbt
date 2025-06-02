-- testing how macro works and how I can utilize it futher

-- rounding number to two digits

{% macro two_places(value, decimal_places = 2)%}
ROUND({{value}},{{decimal_places}})
{% endmacro %}