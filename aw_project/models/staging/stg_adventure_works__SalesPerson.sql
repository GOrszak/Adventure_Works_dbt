WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('sales_aw', 'SalesPerson') }}
), 
renamed AS (
  SELECT 
    BusinessEntityID as BusinessEntityID, 
    TerritoryID as TerritoryID 
  FROM 
    SOURCE
) 
SELECT 
  * 
FROM 
  renamed;
