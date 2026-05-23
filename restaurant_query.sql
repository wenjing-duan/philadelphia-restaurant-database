-- analysis 1
SELECT 
    CASE 
        WHEN is_michelin = 1 THEN 'Michelin (matched)'
        ELSE 'Non-Michelin'
    END AS restaurant_group,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(stars), 2) AS avg_stars,
    ROUND(AVG(review_count), 2) AS avg_review_count,
    ROUND(AVG(price_range), 2) AS avg_price_range
FROM yelp_restaurants
GROUP BY is_michelin;

-- analysis 2
SELECT 
    restaurant_group,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(walkscore), 2) AS avg_walkscore,
    ROUND(AVG(transit_score), 2) AS avg_transit_score,
    ROUND(AVG(bike_score), 2) AS avg_bike_score
FROM (
    SELECT 
        'Michelin' AS restaurant_group,
        walkscore,
        transit_score,
        bike_score
    FROM michelin_restaurants

    UNION ALL

    SELECT 
        'Non-Michelin' AS restaurant_group,
        walkscore,
        transit_score,
        bike_score
    FROM yelp_restaurants
    WHERE is_michelin = 0
) AS combined
GROUP BY restaurant_group;

-- analysis 3
SELECT 
    restaurant_group,
    COUNT(*) AS total_restaurants,
    ROUND(AVG(c.median_income), 2) AS avg_median_income,
    ROUND(AVG(c.poverty_count), 2) AS avg_poverty_count,
    ROUND(AVG(c.bachelor_degree), 2) AS avg_bachelor_degree,
    ROUND(AVG(c.median_age), 2) AS avg_median_age
FROM (
    SELECT 
        'Michelin' AS restaurant_group,
        postal_code
    FROM michelin_restaurants

    UNION ALL

    SELECT 
        'Non-Michelin' AS restaurant_group,
        postal_code
    FROM yelp_restaurants
    WHERE is_michelin = 0
) AS combined
JOIN census_data c
    ON combined.postal_code = c.postal_code
GROUP BY restaurant_group;