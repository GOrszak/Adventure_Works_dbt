WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('person_aw', 'EmailAddress') }}
), 
renamed as (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    EmailAddressID AS EmailAddressID, 
    EmailAddress AS EmailAddress 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
