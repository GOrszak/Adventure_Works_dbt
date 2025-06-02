WITH Category AS (
  SELECT 
   *
  FROM 
    {{ ref(
      'stg_adventure_works__ProductCategory'
    ) }}
), 
Subcategory AS (
  SELECT 
   *
  FROM 
    {{ ref(
      'stg_adventure_works__ProductSubcategory'
    ) }}
), 
Product AS (
  SELECT 
    *
  FROM 
    {{ ref('int_adventure_works__Product') }}
) 
SELECT 
  P.ProductID AS ProductID, 
  P.ProductName AS ProductName, 
  P.Color AS Color, 
  P.ProductSubcategoryID AS ProductSubcategoryID, 
  P.StandardCost AS StandardCost, 
  P.ListPrice AS ListPrice, 
  S.Name AS ProductSubcategoryName, 
  C.Name AS CategoryName, 
  C.ProductCategoryID AS ProductCategoryID 
FROM 
  Product AS P 
  LEFT JOIN Subcategory AS S ON P.ProductSubcategoryID = S.ProductSubcategoryID 
  LEFT JOIN Category AS C ON C.ProductCategoryID = S.ProductCategoryID
