CREATE VIEW continent_currency_usage
AS
SELECT
    cu.continent_code,
    cu.currency_code,
    cu.count AS currency_usage
FROM
    (
    SELECT
        ct.continent_code,
        ct.currency_code,
        ct.count,
        DENSE_RANK() OVER (PARTITION BY ct.continent_code ORDER BY ct.count DESC) AS usage
    FROM
        (
        SELECT
            continent_code,
            currency_code,
            count(currency_code) AS count
        FROM
            countries
        GROUP BY
            continent_code, currency_code
        HAVING
            count(currency_code) > 1
        ) AS ct
    ) AS cu
WHERE
    cu.usage = 1
ORDER BY
    cu.count DESC