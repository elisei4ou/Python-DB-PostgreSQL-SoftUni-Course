SELECT
    start_point,
    end_point,
    leader_id,
    CONCAT(first_name, ' ', last_name)
FROM
    campers AS c
JOIN
    routes AS r
ON
    c.id = r.leader_id