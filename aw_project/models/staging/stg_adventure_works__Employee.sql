 WITH SOURCE as (SELECT 
    * 
  FROM 
    {{ source('hr_aw', 'Employee') }}),
renamed as (
    SELECT
    BusinessEntityID AS BusinessEntityID,
    ParentBusinessEntityID AS ParentBusinessEntityID,
    LoginID AS LoginID,
    OrganizationLevel AS OrganizationLevel,
    BirthDate AS BirthDate,
    MaritalStatus AS MaritalStatus,
    Gender AS Gender,
    HireDate AS HireDate,
    SalariedFlag AS SalariedFlag,
    VacationHours AS VacationHours,
    SickLeaveHours AS SickLeaveHours,
    JobTitle AS JobTitle
    
    FROM
    SOURCE
)

SELECT * from renamed;