WITH SOURCE AS (SELECT *
FROM {{ ref('stg_adventure_works__SalesOrderHeader') }}
),
renamed AS (
        SELECT 
        SalesOrderID,
        SubTotal,
        TaxAmt,
        Freight,
        TotalDue
FROM SOURCE)

SELECT * FROM renamed