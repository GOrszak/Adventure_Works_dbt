SELECT  ProductID, 
        ProductName, 
        Color, 
        ProductSubcategoryID
        StandardCost, 
        ListPrice, 
        ProductSubcategoryName, 
        CategoryName, 
        ProductCategoryID 
FROM {{ ref('merg_DimProduct') }}