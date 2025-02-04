CREATE OR REPLACE PROCEDURE sp_players_team_name(
    IN player_name varchar(50),
    OUT team_name varchar(45))
AS
$$
    BEGIN
        SELECT
            t.name, 'The player currently has no team'
        FROM
            players AS p
        JOIN
            teams AS t
        ON p.team_id = t.id
        WHERE
            CONCAT(first_name, ' ', last_name) = player_name
        INTO team_name;
        IF team_name IS NULL THEN team_name := 'The player currently has no team';
        END IF;
    END
$$
LANGUAGE plpgsql;