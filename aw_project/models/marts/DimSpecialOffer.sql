SELECT  SpecialOfferID,
        Description,
        [Discount%],
        Type,
        Category
FROM {{ ref('merg_DimSpecialOffer') }}