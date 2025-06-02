with SalesOrderDetail as  (

    select 
    
    *
    
    
     from {{ ref('stg_adventure_works__SalesOrderDetail')}}

),

SalesOrderHeader as (

    select 

*
    
     from {{ ref('stg_adventure_works__SalesOrderHeader') }}

),


OrdersCombined as (

SELECT  SOD.SalesOrderID AS SalesOrderID,
        SOD.SalesOrderDetailID AS SalesOrderDetailID,
        SOD.ProductID AS ProductID,
        SOD.SpecialOfferID AS SpecialOfferID,
        SOD.UnitPrice AS UnitPrice,
        SOD.UnitPriceDiscount AS UnitPriceDiscount,
        SOD.LineTotal AS LineTotal,
        SOD.OrderQty AS OrderQty,
        SOH.OrderDate AS OrderDate,
        SOH.DueDate AS DueDate,
        SOH.ShipDate AS ShipDate,
        SOH.OnlineOrderFlag AS OnlineOrderFlag,
        SOH.CustomerID AS CustomerID,
        SOH.TerritoryID as TerritoryID,
        SOH.BillToAddressID	AS BillToAddressID,
        SOH.ShipToAddressID AS ShipToAddressID,
        SOH.ShipMethodID AS ShipMethodID,
        CASE WHEN DATEDIFF(day, DueDate, ShipDate) <= 0 THEN 'On-Time' ELSE 'Late' END AS OnTimeShipping,
        CASE WHEN OnlineOrderFlag = 'true' THEN 'Online' ELSE 'Reseller' END AS SalesType,
        CASE WHEN DATEDIFF(day, DueDate, ShipDate ) <= 0 THEN 1
             WHEN DATEDIFF(day, DueDate, ShipDate ) = 1 THEN 2
             WHEN DATEDIFF(day, DueDate, ShipDate ) = 2 THEN 3
             WHEN DATEDIFF(day, DueDate, ShipDate ) = 3 THEN 4
             ELSE 5 END AS ShipTimeID
FROM SalesOrderDetail AS SOD
LEFT JOIN SalesOrderHeader AS SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
)

SELECT * FROM OrdersCombined


-- CASE WHEN DATEDIFF(day, ShipDate, DueDate) <= 0 THEN 'On-Time' ELSE 'Late' END AS OnTimeShipping

