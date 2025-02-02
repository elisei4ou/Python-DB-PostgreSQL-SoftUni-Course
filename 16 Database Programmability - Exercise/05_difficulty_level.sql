CREATE OR REPLACE FUNCTION fn_difficulty_level(level int)
RETURNS VARCHAR
AS
$$
    DECLARE
       dif_level VARCHAR;
    BEGIN
        IF level <= 40 THEN
           dif_level := 'Normal Difficulty';
        ELSIF level <= 60 THEN
            dif_level := 'Nightmare Difficulty';
        ELSE
            dif_level := 'Hell Difficulty';
        END IF;

        RETURN dif_level;
    END
$$
LANGUAGE plpgsql;

SELECT
    user_id,
    level,
    cash,
    fn_difficulty_level(level)
FROM
    users_games;