WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source(
      'sales_aw', 'SalesOrderDetail'
    ) }}
), 
renamed AS (
  SELECT 
    SalesOrderID AS SalesOrderID, 
    SalesOrderDetailID AS SalesOrderDetailID,  
    ProductID AS ProductID, 
    SpecialOfferID AS SpecialOfferID, 
    {{two_places('UnitPrice')}} AS UnitPrice, -- rounding up to 2 last digits
    UnitPriceDiscount AS UnitPriceDiscount, 
    {{two_places('LineTotal')}} AS LineTotal,  -- round up to 2 last digits
    OrderQty AS OrderQty
  FROM 
    SOURCE
) 
SELECT 
  * 
FROM 
  renamed