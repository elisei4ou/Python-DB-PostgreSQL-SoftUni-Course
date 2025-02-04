SELECT
    p.id,
    first_name || ' ' || last_name as full_name,
    age,
    position,
    salary,
    sd.pace,
    sd.shooting
FROM
    players AS p
JOIN
    skills_data AS sd
ON p.skills_data_id = sd.id
WHERE
    p.position = 'A'
        AND
    p.team_id IS NULL
        AND
    sd.pace + sd.shooting > 130