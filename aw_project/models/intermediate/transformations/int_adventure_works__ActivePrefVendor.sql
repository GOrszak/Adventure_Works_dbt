WITH SOURCE AS (
  SELECT 
    *
  from 
    {{ ref('stg_adventure_works__Vendor') }}
), 
renamed AS (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    AccountNumber AS AccountNumber, 
    [Name] AS Name, 
    CreditRating AS CreditRating, 
    PreferredVendorStatus AS PreferredVendorStatus, 
    ActiveFlag AS ActiveFlag, 
    PurchasingWebServiceURL AS PurchasingWebServiceURL 
  FROM 
    SOURCE 
  WHERE 
    PreferredVendorStatus = 'true' 
    AND ActiveFlag = 'true'
) 
SELECT 
  * 
FROM 
  renamed
