SELECT  ShipMethodID,
        Name
FROM
{{ ref('stg_adventure_works__ShipMethod') }}