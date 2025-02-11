CREATE FUNCTION udf_classification_items_count(classification_name VARCHAR(30))
RETURNS VARCHAR
AS
$$
    DECLARE
        count INT;
    BEGIN
        SELECT
            COUNT(*)
        FROM
            classifications AS c
        JOIN
            items AS i
        ON c.id = i.classification_id
        WHERE
            c.name = classification_name
        GROUP BY
            c.id
        INTO
            count;
        IF count IS NULL THEN RETURN 'No items found.';
        ELSE RETURN 'Found ' || count || ' items.';
        END IF;
    END
$$
LANGUAGE plpgsql