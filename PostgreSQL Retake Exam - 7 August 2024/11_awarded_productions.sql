CREATE PROCEDURE udp_awarded_production(production_title VARCHAR(70))
AS
$$
    BEGIN
        UPDATE actors
        SET awards = awards + 1
        WHERE id IN
        (SELECT
            a.id
        FROM
            productions AS p
        JOIN
            productions_actors AS pa
        ON p.id = pa.production_id
        JOIN
            actors AS a
        ON pa.actor_id = a.id
        WHERE
            p.title = production_title);
    END
$$
LANGUAGE
    plpgsql;

