WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source(
      'sales_aw', 'SalesOrderHeader'
    ) }}
), 
renamed AS (
  SELECT 
  SalesOrderID AS SalesOrderID,
  {{date_conv('OrderDate')}} AS OrderDate,
  {{date_conv('DueDate')}} AS DueDate,
  {{date_conv('ShipDate')}} AS ShipDate,
  Status AS Status,
  CAST(OnlineOrderFlag AS INT) AS OnlineOrderFlag,
    SalesOrderNumber AS SalesOrderNumber,
  CustomerID AS CustomerID,
  TerritoryID AS TerritoryID,
  BillToAddressID AS BillToAddressID,
  ShipToAddressID AS ShipToAddressID,
  ShipMethodID AS ShipMethodID,
  CurrencyRateID AS CurrencyRateID,
  {{two_places('SubTotal')}} AS SubTotal,
  {{two_places('TaxAmt')}} AS TaxAmt,
  {{two_places('Freight')}} AS Freight,
  {{two_places('TotalDue')}} AS TotalDue

  FROM
   SOURCE
) 
SELECT 
  * 
FROM 
  renamed;