WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('person_aw', 'Address') }}
), 
renamed as (
  SELECT 
    AddressID AS AddressID, 
    AddressLine1 AS AddressLine1, 
    AddressLine2 AS AddressLine2, 
    City AS City, 
    StateProvinceID AS StateProvinceID, 
    PostalCode AS PostalCode 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
