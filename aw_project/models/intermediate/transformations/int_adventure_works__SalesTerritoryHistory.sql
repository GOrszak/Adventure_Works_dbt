{{ config(materialized='table') }}

with base_data as (
    select 
    
   *
    
     from {{ ref('stg_adventure_works__SalesTerritoryHistory') }}
),

numbers as (
    select top 100000 row_number() over (order by (select null)) - 1 as n
    from master.dbo.spt_values a
    cross join master.dbo.spt_values b
),

date_expansion as (
    select
        b.BusinessEntityID,
        b.TerritoryID,
        b.StartDate,
        b.EndDate,
        {{date_conv('dateadd(day, n.n, b.StartDate)')}} as Date
    from base_data b
    join numbers n on dateadd(day, n.n, b.StartDate) <= b.EndDate
)

select * from date_expansion
