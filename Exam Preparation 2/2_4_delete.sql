DELETE FROM clients
WHERE
    id IN (
    SELECT
        cl.id
    FROM
        clients as cl
    LEFT JOIN
        courses as co
    ON
        cl.id = co.client_id
    WHERE
        co.id IS NULL
            AND
        length(cl.full_name) > 3)