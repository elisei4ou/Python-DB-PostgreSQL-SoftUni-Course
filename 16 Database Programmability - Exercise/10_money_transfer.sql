CREATE PROCEDURE
    sp_transfer_money(sender_id int, receiver_id int, amount numeric(100, 4))
AS
$$
    BEGIN
        IF (SELECT balance FROM accounts WHERE sender_id = id) >= amount THEN
            CALL sp_withdraw_money(sender_id, amount);
            CALL sp_deposit_money(receiver_id, amount);
        END IF;
    END
$$
LANGUAGE
    plpgsql