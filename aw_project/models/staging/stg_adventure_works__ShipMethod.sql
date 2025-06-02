WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('purchasing_aw', 'ShipMethod')}}
), 
renamed AS (
  SELECT 
    ShipMethodID AS ShipMethodID, 
    [Name] AS Name,
    {{two_places('ShipBase')}} AS ShipBase,
    {{two_places('ShipRate')}} AS ShipRate 
  FROM 
    SOURCE
) 
SELECT 
  * 
from 
  renamed;