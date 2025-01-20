SELECT
    last_name,
    count(*)
FROM
    wizard_deposits
WHERE notes LIKE '%Dumbledore%'
GROUP BY
    last_name
