WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('sales_aw', 'SpecialOffer')}}
), 
renamed AS (
  SELECT 
    SpecialOfferID AS SpecialOfferID, 
    [Description] AS Description,
    DiscountPct AS DiscountPct,
    [Type] AS Type,
    Category AS Category,
    {{date_conv('StartDate')}} AS StartDate,
    {{date_conv('EndDate')}} AS EndDate
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed