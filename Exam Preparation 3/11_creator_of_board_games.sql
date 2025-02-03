CREATE FUNCTION fn_creator_with_board_games(game_creator_name varchar(30) )
RETURNS INT
AS
$$
    DECLARE
        number_of_games INT;
    BEGIN
        SELECT
            COALESCE(count(*), 0)
        FROM
            creators
        JOIN
            creators_board_games
        ON creators.id = creators_board_games.creator_id
        WHERE
            first_name = game_creator_name
        INTO number_of_games;

        RETURN number_of_games;
    END
$$
LANGUAGE plpgsql;