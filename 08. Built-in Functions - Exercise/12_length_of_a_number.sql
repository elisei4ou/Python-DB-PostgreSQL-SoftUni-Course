SELECT
    population,
    LENGTH(CAST(population AS varchar)) as "length"
FROM countries
