UPDATE coaches
SET salary = salary * coach_level
WHERE
    first_name ILIKE 'c%'
        AND
    id IN (
    SELECT
        c.id
    FROM
        coaches AS c
    JOIN
        players_coaches AS pc
    ON
        c.id = pc.coach_id
    GROUP BY
        c.id
    HAVING
        count(*) > 1

)