CREATE OR REPLACE FUNCTION udf_accounts_photos_count(account_username VARCHAR(30))
RETURNS INT
AS
$$
    DECLARE
        photo_count INT;
    BEGIN
        SELECT
            COUNT(*)
        FROM
            accounts AS a
        JOIN
            accounts_photos AS ap
        ON a.id = ap.account_id
        WHERE
            a.username = account_username
        GROUP BY
            a.username
        INTO
            photo_count;
        IF photo_count IS NULL THEN photo_count := 0;
        END IF;
        RETURN photo_count;
    END
$$
LANGUAGE
    plpgsql;