CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    release_year INT,
    rating FLOAT,
    category_name VARCHAR(50),
    publisher_name VARCHAR(50),
    min_players VARCHAR(50),
    max_players VARCHAR(50)
);

CREATE PROCEDURE usp_search_by_category(category varchar(50))
AS
$$
    BEGIN
        INSERT INTO search_results(name, release_year, rating, category_name, publisher_name, min_players, max_players)
        SELECT
            bg.name,
            bg.release_year,
            bg.rating,
            c.name,
            p.name,
            CONCAT(pr.min_players, ' people'),
            CONCAT(pr.max_players, ' people')

        FROM
            board_games AS bg
        JOIN
            publishers AS p
        ON bg.publisher_id = p.id
        JOIN
            categories AS c
        ON bg.category_id = c.id
        JOIN
            players_ranges AS pr
        ON bg.players_range_id = pr.id
        WHERE
            c.name = category
        ORDER BY
            p.name,
            bg.release_year DESC;
    END
$$
LANGUAGE plpgsql;