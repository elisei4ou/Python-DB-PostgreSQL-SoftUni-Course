SELECT
    continent_name,
    TRIM(TRAILING continent_name) as trim
FROM
    continents