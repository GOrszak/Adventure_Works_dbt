WITH ProductVendor AS (
  SELECT 
   *
  FROM 
    {{ ref(
      'stg_adventure_works__ProductVendor'
    ) }}
), 
VendorActiveAndPref AS (
  SELECT 
   *
  FROM 
    {{ ref(
      'int_adventure_works__ActivePrefVendor'
    ) }}
), 
ProductSold AS (
  SELECT *
  FROM 
    {{ ref(
      'int_adventure_works__SalesOrder'
    ) }}
) 
SELECT 
  PS.ProductID AS ProductID, 
  COALESCE(PV.BusinessEntityID, 9999) AS VendorID, 
  COALESCE(VAP.Name, 'Adventure Works') AS VendorName 
FROm 
  ProductVendor AS PV 
  LEFT JOIN VendorActiveAndPref AS VAP ON PV.BusinessEntityID = VAP.BusinessEntityID FULL 
  OUTER JOIN ProductSold as PS ON PS.ProductID = PV.ProductID 
WHERE 
  PS.ProductID is not null
