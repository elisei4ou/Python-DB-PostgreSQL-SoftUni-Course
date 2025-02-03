SELECT
    concat(c.first_name, ' ', c.last_name) AS full_name,
    c.email,
    MAX(bg.rating)
FROM
    creators AS c
JOIN
    creators_board_games AS cbg
ON
    c.id = cbg.creator_id
JOIN
    board_games AS bg
ON
    cbg.board_game_id = bg.id
GROUP BY
    full_name,
    email
HAVING
    email LIKE '%.com'
ORDER BY
    full_name