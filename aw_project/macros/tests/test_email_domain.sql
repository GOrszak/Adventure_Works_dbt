{% test email_ends_with_adventure_works(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} NOT LIKE '%@adventure-works.com'

{% endtest %}