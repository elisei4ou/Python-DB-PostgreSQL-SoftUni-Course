CREATE OR REPLACE PROCEDURE
    sp_withdraw_money(account_id int, money_amount numeric(100, 4))
AS
$$
    BEGIN
        IF (SELECT balance FROM accounts WHERE id = account_id) < money_amount THEN
            RAISE NOTICE 'Insufficient balance to withdraw %', money_amount;
        ELSE
            UPDATE
                accounts
            SET
                balance = balance - money_amount
            WHERE
                id = account_id;
        END IF:
    END
$$
LANGUAGE
    plpgsql;