WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('person_aw', 'CountryRegion') }}
), 
renamed as (
  SELECT 
    CountryRegionCode AS CountryRegionCode, 
    [Name] AS Name
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
