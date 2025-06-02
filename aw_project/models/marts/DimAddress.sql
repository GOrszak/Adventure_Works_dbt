SELECT  AddressID,
	    City,
        Country
FROM {{ ref('merg_DimAddress') }}