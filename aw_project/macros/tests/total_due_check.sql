{% test total_due_check(model, column_name) %}
  SELECT *
  FROM {{ model }}
  WHERE ABS({{ column_name }} - (SubTotal + TaxAmt + Freight)) > 0.01
{% endtest %}