WITH Adress AS (SELECT *

 FROM {{ ref('stg_adventure_works__Address') }}),


StateProvince AS (SELECT *
 FROM {{ ref('stg_adventure_works__StateProvince')}}),


CountryRegion AS (SELECT *
 FROM {{ ref('stg_adventure_works__CountryRegion') }})


SELECT  A.AddressID,
        A.City,
        CG.Name AS Country
FROM Adress AS A
LEFT JOIN StateProvince AS SP
ON A.StateProvinceID = SP.StateProvinceID
LEFT JOIN CountryRegion AS CG 
ON SP.CountryRegionCode = CG.CountryRegionCode