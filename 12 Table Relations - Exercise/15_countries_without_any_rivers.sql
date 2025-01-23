SELECT
    count(*) AS countries_without_rivers
FROM
    countries AS c
LEFT JOIN
    countries_rivers AS r
ON
    c.country_code = r.country_code
WHERE r.country_code IS NULL