CREATE OR REPLACE FUNCTION fn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BOOLEAN
AS
$$
    DECLARE
        letter CHAR;
        idx INT := 1;
    BEGIN
        WHILE idx <= LENGTH(word) LOOP
            letter := SUBSTRING(word, idx, 1);
            IF POSITION(lower(letter) IN lower(set_of_letters)) = 0 THEN
                RETURN FALSE;
            ELSE
                idx = idx + 1;
            END IF;
        END LOOP;
        RETURN TRUE;
    END
$$
LANGUAGE plpgsql;