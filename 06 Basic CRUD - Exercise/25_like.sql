SELECT
    name,
    start_date
FROM projects
WHERE name ILIKE 'MOUNT%'
ORDER BY id 