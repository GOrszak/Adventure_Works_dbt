WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('person_aw', 'StateProvince')}}
), 
renamed AS (
  SELECT 
    StateProvinceID AS StateProvinceID,
    StateProvinceCode AS StateProvinceCode,
    CountryRegionCode AS CountryRegionCode,
    IsOnlyStateProvinceFlag AS IsOnlyStateProvinceFlag,
    [Name] AS Name,
    TerritoryID AS TerritoryID,
    ModifiedDate AS ModifiedDate
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed


