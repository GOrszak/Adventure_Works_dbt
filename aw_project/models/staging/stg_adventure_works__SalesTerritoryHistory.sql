WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source(
      'sales_aw', 'SalesTerritoryHistory'
    ) }}
), 
renamed AS (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    TerritoryID AS TerritoryID, 
    {{date_conv('StartDate') }} AS StartDate, 
    CASE WHEN {{date_conv('EndDate') }} is null then '2044/12/31' else {{date_conv('EndDate') }} END AS EndDate
  FROM 
    SOURCE
)

SELECT 
  * 
from 
  renamed;
