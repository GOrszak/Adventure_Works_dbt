{% set unpivot_columns = get_unpivot_columns('AW_QUOTA', ['FiscalQuarter']) %}

SELECT
    FiscalQuarter as FiscalQuarter,
    Attribute As Attribute,
    QuarterYearValue AS Quota
FROM (
    SELECT 
        FiscalQuarter,
        {% for col in unpivot_columns %}
            CAST([{{ col }}] AS VARCHAR) AS [{{ col }}]{% if not loop.last %}, {% endif %}
        {% endfor %}
    FROM {{ ref('AW_QUOTA') }}
) src
UNPIVOT (
    QuarterYearValue FOR Attribute IN (
        {% for col in unpivot_columns %}
            [{{ col }}]{% if not loop.last %}, {% endif %}
        {% endfor %}
    )
) AS unpvt
WHERE FiscalQuarter IS NOT NULL