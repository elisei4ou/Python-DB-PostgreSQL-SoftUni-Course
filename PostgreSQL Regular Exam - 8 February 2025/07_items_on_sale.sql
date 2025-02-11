SELECT
    i.name,
    CONCAT(upper(b.name), '/', lower(c.name)) AS promotion ,
    CONCAT('On sale: ', i.description) AS description,
    i.quantity
FROM
    items AS i
LEFT JOIN
    orders_items AS oi
ON i.id = oi.item_id
JOIN
    brands AS b
ON i.brand_id = b.id
JOIN
    classifications AS c
ON i.classification_id = c.id
WHERE
    order_id IS NULL
ORDER BY
    i.quantity DESC,
    i.name