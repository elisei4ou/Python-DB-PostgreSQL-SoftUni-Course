DELETE FROM countries
WHERE id IN
(SELECT
    c.id
FROM
    countries AS c
LEFT JOIN
    actors AS a
ON c.id = a.country_id
LEFT JOIN
    productions AS p
ON c.id = p.country_id
WHERE
    a.country_id IS NULL
        AND
    p.country_id IS NULL)
