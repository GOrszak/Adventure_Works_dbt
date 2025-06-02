WITH SalesPerson AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__SalesPerson') }}
),

Territory AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__SalesTerritoryHistory') }}
),

Person AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__Person') }}
),

Email AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__EmailAddress') }}
),

Employee AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__Employee') }}
),

Combined AS (
    SELECT 
        SP.BusinessEntityID,
        P.FullName,
        E.EmailAddress,
        Emp.ParentBusinessEntityID,
        CASE WHEN T.TerritoryID IS NULL THEN NULL ELSE Emp.ParentBusinessEntityID END AS ManagerID,
        CASE WHEN T.TerritoryID IS NULL THEN SP.TerritoryID ELSE T.TerritoryID END AS TerritoryID,
        T.StartDate,
        COALESCE(T.EndDate, CONVERT(DATE, '2044-12-31', 120)) AS EndDate,
        CASE WHEN YEAR(GETDATE()) - YEAR(T.StartDate) <= 13 THEN 'New' ELSE 'Established' END AS Established_New,
        ROW_NUMBER() OVER(PARTITION BY SP.BusinessEntityID ORDER BY COALESCE(T.EndDate, CONVERT(DATE, '2044-12-31', 120)) DESC) AS rn
    FROM SalesPerson AS SP
    LEFT JOIN Territory AS T ON SP.BusinessEntityID = T.BusinessEntityID
    LEFT JOIN Person AS P ON SP.BusinessEntityID = P.BusinessEntityID
    LEFT JOIN Email AS E ON SP.BusinessEntityID = E.BusinessEntityID
    LEFT JOIN Employee AS Emp ON SP.BusinessEntityID = Emp.BusinessEntityID
)

SELECT  
    BusinessEntityID,
    FullName,
    EmailAddress,
    ParentBusinessEntityID,
    ManagerID,
    TerritoryID,
    Established_New
FROM (
    SELECT *
    FROM Combined
    WHERE rn = 1
) AS filtered
UNION 
SELECT
 -1,
 'Website',
 NULL,
 285,
 285,
 NULL,
 'Established';