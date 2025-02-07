SELECT
    *
FROM
    countries
WHERE
    continent = 'South America'
        AND
    (LEFT(currency, 1) = 'P'
        OR
    LEFT(currency, 1) = 'U')
ORDER BY
    currency DESC,
    id 