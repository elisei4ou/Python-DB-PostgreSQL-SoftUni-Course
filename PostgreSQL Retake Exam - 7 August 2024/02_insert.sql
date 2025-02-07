INSERT INTO actors(first_name, last_name, birthdate, height, awards, country_id)
(SELECT
    reverse(first_name),
    reverse(last_name),
    birthdate - INTERVAL '2 days',
    CASE
        WHEN height IS NOT NULL THEN height + 10
        WHEN height IS NULL THEN 10
    END,
    country_id,
    (SELECT id from countries WHERE name = 'Armenia')
FROM
    actors
WHERE
    id BETWEEN 10 AND 20)