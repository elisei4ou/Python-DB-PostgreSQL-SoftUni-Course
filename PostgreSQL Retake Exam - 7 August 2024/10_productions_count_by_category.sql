CREATE OR REPLACE FUNCTION udf_category_productions_count(category_name VARCHAR(50))
RETURNS VARCHAR
AS
$$
    DECLARE
        count INT;
        output VARCHAR;
    BEGIN
        SELECT
            count(*)
        FROM
            categories AS c
        JOIN
            categories_productions AS cp
        ON
            c.id = cp.category_id
        WHERE
            c.name = category_name
        INTO
            count;
        RETURN 'Found ' || coalesce(count, 0) || ' productions.';
    END
$$
LANGUAGE
    plpgsql;