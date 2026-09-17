-- Question 1: Top 5 highest-rated restaurants in Koramangala serving North Indian cuisine

SELECT TOP 5 *
FROM zomato_restaurants
WHERE location = 'Koramangala'
AND cuisines LIKE '%North Indian%'
ORDER BY rating DESC
;


-- Question 2: Average cost for two people by cuisine and top 3 expensive cuisines

SELECT TOP 3 cuisines,
       AVG(approx_cost_for_two_people) AS average_cost
FROM zomato_restaurants
GROUP BY cuisines
ORDER BY average_cost DESC;


-- Question 3: Restaurants offering online delivery with rating below 3.0

SELECT *
FROM zomato_restaurants
WHERE online_order = 'Yes'
AND rating < 3.0;

/*
Marketing Strategy:

1. Improve food quality and consistency.
2. Offer discounts and promotional campaigns.
3. Improve delivery speed and customer service.
4. Encourage customer reviews and feedback.
5. Monitor customer complaints and resolve issues quickly.
*/


-- Question 4: Segment restaurants into Budget, Mid-Range and Premium categories

SELECT
CASE
    WHEN approx_cost_for_two_people < 400 THEN 'Budget'
    WHEN approx_cost_for_two_people BETWEEN 400 AND 800 THEN 'Mid-Range'
    ELSE 'Premium'
END AS price_segment,
COUNT(*) AS restaurant_count
FROM zomato_restaurants
    GROUP BY
        CASE
            WHEN approx_cost_for_two_people < 400 THEN 'Budget'
            WHEN approx_cost_for_two_people BETWEEN 400 AND 800 THEN 'Mid-Range'
            ELSE 'Premium'
        END;


-- Question 5: Top 10 restaurant chains by number of outlets

SELECT TOP 10
    name,
    COUNT(*) AS total_outlets
FROM zomato_restaurants
GROUP BY name
ORDER BY total_outlets DESC;