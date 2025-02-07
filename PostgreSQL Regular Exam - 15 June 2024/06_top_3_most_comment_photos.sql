SELECT
    p.id AS photo_id,
    p.capture_date,
    p.description,
    COUNT(c.photo_id) AS comments_count
FROM
    photos AS p
RIGHT JOIN
    comments AS c
ON p.id = c.photo_id
WHERE
    p.description IS NOT NULL
GROUP BY
    p.id, p.capture_date, p.description
ORDER BY
    comments_count DESC,
    photo_id
LIMIT 3
