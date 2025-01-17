SELECT
    capital,
    translate(capital, 'áãåçéíñóú', 'aaaceinou') AS translated_name
FROM countries
WHERE capital IS NOT NULL