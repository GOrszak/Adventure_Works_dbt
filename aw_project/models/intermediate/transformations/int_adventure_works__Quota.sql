WITH SOURCE AS (
    SELECT *
    FROM {{ ref('stg_adventure_works__Quota') }}
),

SalesQuota AS (
    SELECT  
        CONCAT(LEFT(FiscalQuarter, 4), '-', SUBSTRING(FiscalQuarter, 5, 2)) AS FiscalQuarterID,
        TRY_CAST(LEFT(FiscalQuarter, 4) AS INT) AS Fiscal_Year,
        SUBSTRING(FiscalQuarter, 5, 2) AS Fiscal_Quarter,
        TRY_CAST(Attribute AS INT) AS SalesPersonID,
        TRY_CAST(Quota AS FLOAT) AS Quota
    FROM SOURCE
),

FiscalQuarterDates AS (
    SELECT
        Fiscal_Year,
        FiscalQuarterID,
        Fiscal_Quarter,
        SalesPersonID,
        Quota,

        -- Adjust fiscal calendar: Q1 starts in July of the *previous* calendar year
        CASE
            WHEN Fiscal_Quarter = 'Q1' THEN DATEFROMPARTS(Fiscal_Year - 1, 7, 1)
            WHEN Fiscal_Quarter = 'Q2' THEN DATEFROMPARTS(Fiscal_Year - 1, 10, 1)
            WHEN Fiscal_Quarter = 'Q3' THEN DATEFROMPARTS(Fiscal_Year, 1, 1)
            WHEN Fiscal_Quarter = 'Q4' THEN DATEFROMPARTS(Fiscal_Year, 4, 1)
        END AS QuarterStartDate,

        CASE
            WHEN Fiscal_Quarter = 'Q1' THEN EOMONTH(DATEFROMPARTS(Fiscal_Year - 1, 9, 1))
            WHEN Fiscal_Quarter = 'Q2' THEN EOMONTH(DATEFROMPARTS(Fiscal_Year - 1, 12, 1))
            WHEN Fiscal_Quarter = 'Q3' THEN EOMONTH(DATEFROMPARTS(Fiscal_Year, 3, 1))
            WHEN Fiscal_Quarter = 'Q4' THEN EOMONTH(DATEFROMPARTS(Fiscal_Year, 6, 1))
        END AS QuarterEndDate,

        -- Leap year detection (relevant for Q3, which contains February)
        CASE 
            WHEN Fiscal_Quarter = 'Q3' AND (Fiscal_Year % 4 = 0 AND (Fiscal_Year % 100 != 0 OR Fiscal_Year % 400 = 0))
            THEN 1 ELSE 0
        END AS IsLeapYear
    FROM SalesQuota
),

Col AS (
    SELECT
        FiscalQuarterID,
        Fiscal_Year,
        Fiscal_Quarter,
        SalesPersonID,
        Quota,
        DATEDIFF(DAY, QuarterStartDate, QuarterEndDate) + 1 AS DaysInQuarter
    FROM FiscalQuarterDates
),

Final AS (
    SELECT *,
            ROUND(CAST(Quota AS FLOAT)/CAST(DaysInQuarter AS INT),2) AS Quota_Daily
    FROM Col

)

SELECT * FROM Final;
