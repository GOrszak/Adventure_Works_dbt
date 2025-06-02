WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('sales_aw', 'SalesTerritory') }}
), 
renamed AS (
  SELECT 
    TerritoryID as TerritoryID, 
    Name as TerritoryName, 
    CountryRegionCode as CountryRegionCode, 
    [Group] as TerritoryGroup 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed;