SELECT  CustomerID
        StoreID,
        TerritoryID,
        StoreName,
        SalesPersonID,
        ClientName,
        ContactType,
        FullName,
        PhoneNumber,
        EmailAddress
FROM {{ ref('merg_DimCustomer') }}