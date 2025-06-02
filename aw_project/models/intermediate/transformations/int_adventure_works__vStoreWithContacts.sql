WITH SOURCE AS (
  SELECT 
    
  *

  FROM 
    {{ ref('stg_adventure_works__vStoreWithContacts') }}
), 
renamed as (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    [Name] AS ClientName, 
    ContactType AS ContactType, 
    CONCAT(FirstName, ' ', LastName) AS FullName, 
    PhoneNumber AS PhoneNumber, 
    EmailAddress AS EmailAddress 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed;
