SELECT
    full_name,
    count(car_id),
    SUM(bill)
FROM
    clients AS cl
JOIN courses AS co ON cl.id = co.client_id
GROUP BY
    full_name
HAVING
    SUbstring(full_name, 2, 1) = 'a'
        AND
    count(car_id) > 1
ORDER BY
    cl.full_name