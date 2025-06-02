WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('sales_aw', 'Customer') }}
), 
renamed as (
  SELECT 
    CustomerID AS CustomerID, 
    PersonID AS PersonID, 
    StoreID AS StoreID, 
    TerritoryID AS TerritoryID, 
    AccountNumber AS AccountNumber 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
