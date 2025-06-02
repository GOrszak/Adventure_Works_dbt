WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source(
      'sales_aw', 'vStoreWithAddresses'
    ) }}
), 
renamed AS (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    [Name] AS StoreName, 
    AddressLine1 AS AddressLine1, 
    AddressLine2 AS AddressLine2, 
    City AS City, 
    PostalCode AS PostalCode, 
    CountryRegionName AS CountryRegionName 
  FROM 
    SOURCE
) 
SELECT 
  * 
FROM 
  renamed;
