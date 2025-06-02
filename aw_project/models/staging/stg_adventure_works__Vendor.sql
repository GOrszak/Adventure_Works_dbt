WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('purchasing_aw', 'Vendor')}}
),
renamed AS 
( SELECT
    BusinessEntityID AS BusinessEntityID,
    AccountNumber AS AccountNumber,
    [Name] AS Name,
    CreditRating AS CreditRating,
    PreferredVendorStatus AS PreferredVendorStatus,
    ActiveFlag AS ActiveFlag,
    PurchasingWebServiceURL AS PurchasingWebServiceURL,
    ModifiedDate AS ModifiedDate
 FROM
    SOURCE)

SELECT * from renamed