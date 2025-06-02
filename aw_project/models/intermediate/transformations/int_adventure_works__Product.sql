WITH SOURCE AS (
  SELECT 
    *
  FROM 
    {{ref('stg_adventure_works__Product')}}
), 
renamed AS (
  SELECT 
    ProductID as ProductID, 
    ProductName as ProductName, 
    Color as Color, 
    ProductSubcategoryID as ProductSubcategoryID,
    StandardCost AS StandardCost,
    ListPrice AS ListPrice 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed


   