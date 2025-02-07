SELECT
    CONCAT(a.id, ' ', a.username) AS id_username,
    a.email
FROM
    accounts AS a
JOIN
    accounts_photos AS ap
ON a.id = ap.account_id
JOIN
    photos AS p
ON ap.photo_id = p.id
WHERE
    ap.photo_id = ap.account_id
ORDER BY
    id_username