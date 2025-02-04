SELECT
    t.id,
    t.name,
    count(p) AS player_count,
    t.fan_base
FROM
    teams AS t
LEFT JOIN
    players AS p
ON t.id = p.team_id
WHERE
    fan_base > 30000
GROUP BY
    t.id, t.name, t.fan_base
ORDER BY
    player_count DESC,
    t.fan_base DESC

