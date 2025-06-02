-- testing how macro works and how I can utilize it futher

-- formating date + timestamp to date only in 'dd-MM-yyyy' formatdb

{% macro date_conv(date,format = 'yyyy/MM/dd')%}
FORMAT(CAST({{date}} AS DATE),'{{format}}')
{% endmacro %}