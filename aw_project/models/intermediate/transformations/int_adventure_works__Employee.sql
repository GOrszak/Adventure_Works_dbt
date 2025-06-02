WITH SOURCE as (
  SELECT 
    *
  FROM 
    {{ ref('stg_adventure_works__Employee') }}
), 
renamed as (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    ParentBusinessEntityID AS ParentBusinessEntityID, 
    JobTitle AS JobTitle 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed