SELECT
    concat(number, ' ', street) AS adress,
    city_id
FROM addresses
WHERE city_id >= 2
AND city_id % 2 = 0
ORDER BY city_id