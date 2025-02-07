SELECT
    p.name,
    ROUND(AVG(p.price), 2) AS average_price,
    count(f) AS total_feedbacks
FROM
    products AS p
JOIN
    feedbacks AS f
ON p.id = f.product_id
WHERE
    price > 15
GROUP BY
    p.name
HAVING
    count(f) > 1
ORDER BY
    total_feedbacks,
    average_price DESC