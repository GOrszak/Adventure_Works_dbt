WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source(
      'sales_aw', 'Store'
    ) }}
),
renamed AS 
( SELECT
    BusinessEntityID AS StoreID,
    [Name] AS Name,
    SalesPersonID AS SalesPersonID
 FROM
    SOURCE)

SELECT * from renamed