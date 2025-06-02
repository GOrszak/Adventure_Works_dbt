WITH SOURCE AS (SELECT  *
FROM
 {{ ref('stg_adventure_works__SpecialOffer') }}
 ),
 renamed AS (
        SELECT  SpecialOfferID,
                Description,
                DiscountPct*100 AS 'Discount%',
                Type,
                Category
        FROM SOURCE)

SELECT * FROM renamed;