SELECT
    c.id AS customer_id,
    c.first_name || ' ' || c.last_name AS full_name,
    count(*) AS total_orders,
    CASE
        WHEN loyalty_card IS TRUE THEN 'Loyal Customer'
        ELSE 'Regular Customer'
    END
FROM
    customers AS c
JOIN
    orders AS o
ON c.id = o.customer_id
LEFT JOIN
    reviews AS r
ON c.id = r.customer_id
WHERE
    r.created_at IS NULL
GROUP BY
    c.id, full_name
ORDER BY
    total_orders DESC,
    customer_id
;