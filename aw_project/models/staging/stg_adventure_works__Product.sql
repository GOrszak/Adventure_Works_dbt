WITH SOURCE AS ( SELECT 
    * 
  FROM 
    {{ source('prod_aw', 'Product') }}
), 
renamed AS (
  SELECT 
    ProductID as ProductID, 
    [Name] as ProductName,
    ProductNumber AS ProductNumber,
    MakeFlag AS MakeFlag,
    FinishedGoodsFlag AS FinishedGoodsFlag,
    Color as Color, 
    SafetyStockLevel AS SafetyStockLevel,
    ReorderPoint AS ReorderPoint,
    StandardCost AS StandardCost,
    SellStartDate AS SellStartDate,
    SellEndDate AS SellEndDate,
    DiscontinuedDate AS DiscontinuedDate,
    ProductSubcategoryID as ProductSubcategoryID,
    ListPrice As ListPrice
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed