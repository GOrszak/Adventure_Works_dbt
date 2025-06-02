WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('prod_aw', 'ProductCategory') }}
), 
renamed as (
  SELECT 
    ProductCategoryID AS ProductCategoryID, 
    [Name] AS Name
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
