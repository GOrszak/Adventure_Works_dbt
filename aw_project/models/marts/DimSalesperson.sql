SELECT  BusinessEntityID,
        FullName,
        EmailAddress,
        ParentBusinessEntityID,
        ManagerID,
        TerritoryID,
        Established_New
FROM {{ ref('merg_DimSalesperson') }}