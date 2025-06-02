SELECT  SalesOrderID,
        SubTotal,
        TaxAmt,
        Freight,
        TotalDue
FROM {{ref('merg_DimTaxFreight')}}