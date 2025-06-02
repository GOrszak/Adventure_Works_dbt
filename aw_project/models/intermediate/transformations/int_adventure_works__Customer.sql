WITH SOURCE AS (
  SELECT 
    *
  from 
    {{ ref(
      'stg_adventure_works__Customer'
    ) }}
), 
renamed AS (
  SELECT 
    CustomerID AS CustomerID, 
    StoreID AS StoreID, 
    TerritoryID AS TerritoryID 
  FROM 
    SOURCE
) 
SELECT 
  * 
FROM 
  renamed
