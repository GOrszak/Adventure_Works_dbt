WITH Customer AS (

    SELECT *
    FROM {{ ref('int_adventure_works__Customer') }}
),
Store AS (

    SELECT *
    FROM {{ ref('stg_adventure_works__Store') }}

),
Contact AS (
    SELECT
            *
    FROM {{ ref('int_adventure_works__vStoreWithContacts') }}
    
),

Combined AS (


SELECT  C.CustomerID AS CustomerID,
        CASE WHEN C.StoreID is null THEN -1 ELSE C.StoreID END AS StoreID,
        C.TerritoryID AS TerritoryID,
        CASE WHEN S.Name is null THEN 'Website' ELSE S.Name END AS StoreName,
        S.SalesPersonID AS SalesPersonID,
        CO.ClientName AS ClientName,
        CO.ContactType AS ContactType,
        CO.FullName AS FullName,
        CO.PhoneNumber AS PhoneNumber,
        CO.EmailAddress AS EmailAddress,
        ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY ContactType ASC) AS rn
FROM Customer AS C
LEFT JOIN Store AS S
ON C.StoreID = S.StoreID
LEFT JOIN Contact AS CO
ON C.StoreID = CO.BusinessEntityID

)

SELECT  CustomerID AS CustomerID,
        StoreID AS StoreID,
        TerritoryID AS TerritoryID,
        StoreName AS StoreName,
        SalesPersonID AS SalesPersonID,
        ClientName AS ClientName,
        ContactType AS ContactType,
        FullName AS FullName,
        PhoneNumber AS PhoneNumber,
        EmailAddress AS EmailAddress
FROM Combined
WHERE rn = 1



