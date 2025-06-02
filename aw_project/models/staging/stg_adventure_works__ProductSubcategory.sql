WITH SOURCE as (
  SELECT 
    * 
  FROM 
    {{ source('prod_aw', 'ProductSubcategory') }}
), 
renamed as (
  SELECT 
    ProductSubcategoryID AS ProductSubcategoryID, 
    ProductCategoryID AS ProductCategoryID, 
    [Name] AS Name
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed
