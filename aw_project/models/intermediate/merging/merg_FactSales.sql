with SalesOrderDetail as (
  select 
   *
  from 
    {{ ref(
      'int_adventure_works__SalesOrder'
    ) }}
), 
SalesTerritoryHistory as (
  select 
    *
  from 
    {{ ref(
      'int_adventure_works__SalesTerritoryHistory'
    ) }}
) 
SELECT 
  SOD.SalesOrderID AS SalesOrderID, 
  SOD.SalesOrderDetailID AS SalesOrderDetailID, 
  SOD.ProductID AS ProductID, 
  SOD.SpecialOfferID AS SpecialOfferID, 
  SOD.UnitPrice AS UnitPrice, 
  SOD.UnitPriceDiscount AS UnitPriceDiscount, 
  SOD.LineTotal AS LineTotal, 
  SOD.OrderQty AS OrderQty, 
  SOD.OrderDate AS OrderDate, 
  SOD.DueDate AS DueDate, 
  SOD.ShipDate AS ShipDate, 
  SOD.OnlineOrderFlag AS OnlineOrderFlag, 
  SOD.CustomerID AS CustomerID, 
  SOD.TerritoryID AS TerritoryID, 
  SOD.BillToAddressID AS BillToAddressID, 
  SOD.ShipToAddressID AS ShipToAddressID, 
  SOD.ShipMethodID AS ShipMethodID, 
  SOD.OnTimeShipping AS OnTimeShipping, 
  SOD.SalesType AS SalesType, 
  SOD.ShipTimeID AS ShipTimeID, 
  CASE WHEN OnlineOrderFlag = 'true' THEN -1 ELSE STH.BusinessEntityID END AS SalesPersonID 
FROM 
  SalesOrderDetail AS SOD 
  LEFT JOIN SalesTerritoryHistory AS STH ON SOD.TerritoryID = STH.TerritoryID 
  AND SOD.OrderDate = STH.Date
