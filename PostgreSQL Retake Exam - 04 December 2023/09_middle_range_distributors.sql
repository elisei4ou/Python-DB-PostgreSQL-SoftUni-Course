SELECT
    d.name AS distributor_name,
    i.name AS ingredient_name,
    p.name AS product_name,
    AVG(rate)
FROM
    distributors AS d
JOIN
    ingredients AS i
ON d.id = i.distributor_id
JOIN
    products_ingredients AS pi
ON i.id = pi.ingredient_id
JOIN
    products AS p
ON pi.product_id = p.id
JOIN
    feedbacks AS f
ON p.id = f.product_id
GROUP BY d.name, i.name, p.name
HAVING AVG(rate) BETWEEN 5 AND 8
ORDER BY distributor_name,
         ingredient_name,
         product_name