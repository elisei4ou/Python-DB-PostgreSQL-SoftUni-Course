SELECT
    b.id,
    b.name,
    b.release_year,
    c.name
FROM
    board_games AS b
JOIN
    categories AS c
ON
    b.category_id = c.id
WHERE
    c.name = 'Strategy Games'
        OR
    c.name = 'Wargames'
ORDER BY
    b.release_year desc 