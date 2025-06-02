WITH SOURCE AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__SalesTerritory') }}
),

Region AS (

    SELECT  TerritoryID,
            TerritoryName, 
            CountryRegionCode,
            TerritoryGroup,
            CASE WHEN CountryRegionCode = 'US' THEN 'United States' ELSE TerritoryName END AS CountryName
     FROM SOURCE

)


SELECT * FROM Region