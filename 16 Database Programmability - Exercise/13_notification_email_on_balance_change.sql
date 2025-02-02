CREATE TABLE notification_emails(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    recipient_id INT,
    subject VARCHAR(100),
    body VARCHAR(200)
)
;

CREATE OR REPLACE FUNCTION
    trigger_fn_send_email_on_balance_change()
RETURNS TRIGGER
AS
$$
    BEGIN
        INSERT INTO
            notification_emails(recipient_id, subject, body)
        VALUES
            (NEW.account_id,
    'Balance change for account: %', NEW.account_id,
            'On % your balance was changed from % to %.', DATE(NOW()), NEW.old_sum, NEW.new_sum);
    END
$$
LANGUAGE plpgsql
;

CREATE TRIGGER
    tr_send_email_on_balance_change
AFTER UPDATE ON logs
FOR EACH ROW
EXECUTE FUNCTION trigger_fn_send_email_on_balance_change()
;


