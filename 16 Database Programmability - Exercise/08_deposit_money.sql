CREATE PROCEDURE
    sp_deposit_money(account_id int, money_amount numeric(100, 4))
AS
$$
    BEGIN
        UPDATE
            accounts
        SET
            balance = balance + money_amount
        WHERE
            id = account_id
        ;
        COMMIT;
    END

$$
LANGUAGE
    plpgsql