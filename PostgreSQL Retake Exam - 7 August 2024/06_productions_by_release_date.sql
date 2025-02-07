SELECT
    prd.id,
    prd.title,
    pri.duration,
    ROUND(pri.budget, 1) AS budget,
    TO_CHAR(pri.release_date, 'MM-YY') AS release_date
FROM
    productions AS prd
JOIN
    productions_info AS pri
ON prd.production_info_id = pri.id
WHERE
    extract(year from pri.release_date) IN (2023, 2024)
        AND
    pri.budget > 1500000.00
ORDER BY
    budget,
    pri.duration DESC,
    prd.id
LIMIT
    3

