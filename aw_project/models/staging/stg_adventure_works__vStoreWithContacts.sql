WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('sales_aw', 'vStoreWithContacts') }}
),
renamed AS 
( SELECT
    BusinessEntityID AS BusinessEntityID, 
    [Name] AS Name,
    ContactType AS ContactType, 
    Title AS Title, 
    FirstName AS FirstName, 
    MiddleName AS MiddleName, 
    LastName AS LastName, 
    Suffix AS Suffix, 
    PhoneNumber AS PhoneNumber, 
    PhoneNumberType AS PhoneNumberType, 
    EmailAddress AS EmailAddress, 
    EmailPromotion AS EmailPromotion
 
 FROM
    SOURCE)

SELECT * from renamed