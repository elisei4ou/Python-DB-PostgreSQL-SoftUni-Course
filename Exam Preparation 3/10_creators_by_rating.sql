SELECT
    cr.last_name,
    CEIL(AVG(rating)) AS average_rating,
    p.name
FROM
    creators AS cr
JOIN
    creators_board_games AS cbg
ON
    cr.id = cbg.creator_id
JOIN
    board_games AS bg
ON
    cbg.board_game_id = bg.id
JOIN
    publishers AS p
ON
    bg.publisher_id = p.id
WHERE
    p.name = 'Stonemaier Games'
GROUP BY
    cr.last_name,
    p.name
ORDER BY
    average_rating DESC
