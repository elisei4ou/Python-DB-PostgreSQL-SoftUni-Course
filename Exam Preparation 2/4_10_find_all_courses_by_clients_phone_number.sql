CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num varchar(20))
RETURNS INT
AS
$$
    DECLARE num INT;
    BEGIN
    SELECT
        COALESCE(count(*), 0)
    FROM
        courses AS co
    JOIN
        clients AS cl
    ON co.client_id = cl.id
    GROUP BY
        cl.phone_number
    HAVING
        cl.phone_number = phone_num
    INTO num;
    IF num IS NULL THEN num := 0;
    END IF;
    RETURN num;

    END
$$
LANGUAGE plpgsql;