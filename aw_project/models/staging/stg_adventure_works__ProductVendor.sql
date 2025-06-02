WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('purchasing_aw', 'ProductVendor')}}
), 
renamed as (
  SELECT 
    ProductID AS ProductID,
    BusinessEntityID AS BusinessEntityID,
    AverageLeadTime AS AverageLeadTime,
    {{two_places('StandardPrice')}} AS StandardPrice,
    {{two_places('LastReceiptCost')}} AS LastReceiptCost,
    LastReceiptDate AS LastReceiptDate,
    MinOrderQty AS MinOrderQty,
    MaxOrderQty AS MaxOrderQty,
    OnOrderQty AS OnOrderQty,
    UnitMeasureCode AS UnitMeasureCode
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
