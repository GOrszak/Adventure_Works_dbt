SELECT  ShipMethodID,
        Name
FROM {{ ref('merg_DimShipMethod') }}