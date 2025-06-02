SELECT  TerritoryID,
        TerritoryName,
        CountryRegionCode,
        TerritoryGroup,
        CountryName
FROM {{ ref('merg_DimRegion') }}