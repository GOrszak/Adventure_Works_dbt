SELECT  ProductID, 
        VendorID, 
        VendorName
 FROM {{ ref('merg_DimVendor') }}