CREATE OR REPLACE PROCEDURE sp_retrieving_holders_with_balance_higher_than(searched_balance numeric)
AS
$$
    DECLARE
        rec RECORD;
    BEGIN
        FOR rec IN
            SELECT
                CONCAT(ah.first_name, ' ', ah.last_name) AS full_name,
                SUM(a.balance) AS all_balance
            FROM
                account_holders AS ah
            JOIN
                accounts AS a
            ON
                ah.id = a.account_holder_id
            GROUP BY
                a.account_holder_id,
                full_name
            HAVING
                SUM(a.balance) >= searched_balance
            ORDER BY
                full_name
        LOOP
        RAISE NOTICE '% - %', rec.full_name, rec.all_balance;
        END LOOP;

    END;
$$
LANGUAGE plpgsql