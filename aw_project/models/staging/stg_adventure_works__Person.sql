WITH SOURCE AS (
  SELECT 
    * 
  FROM 
    {{ source('person_aw', 'Person') }}
), 
renamed AS (
  SELECT 
    BusinessEntityID AS BusinessEntityID, 
    PersonType AS PersonType, 
    CONCAT(FirstName, ' ', LastName) AS FullName
  FROM 
    SOURCE
) 
SELECT 
  * 
FROM 
  renamed;
