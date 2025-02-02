CREATE OR REPLACE FUNCTION fn_cash_in_users_games(game_name varchar(50))
RETURNS TABLE
    (
        total_cash NUMERIC
    )
AS
$$
    BEGIN
        RETURN QUERY SELECT
            TRUNC(SUM(rn.cash), 2)
        FROM
            (
            SELECT
                ug.cash,
                ROW_NUMBER() OVER (ORDER BY ug.cash DESC) AS odd_rows
            FROM
                users_games AS ug
            JOIN
                games AS g
            ON
                ug.game_id = g.id
            WHERE
                g.name = game_name
            ) AS rn
        WHERE
            odd_rows % 2 != 0
        ;
    END
$$
LANGUAGE
    plpgsql
;