CREATE TABLE manufacturers(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE production_years(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    established_on DATE,
    manufacturer_id INT REFERENCES manufacturers(id)
);

CREATE TABLE models(
    id INT GENERATED ALWAYS AS IDENTITY
        (START WITH 1000 INCREMENT 1) PRIMARY KEY,
    model_name VARCHAR,
    manufacturer_id INT REFERENCES manufacturers(id)
);

INSERT INTO manufacturers (name)
VALUES
('BMW'),
('Tesla'),
('Lada');

INSERT INTO models (model_name, manufacturer_id)
VALUES
('X1', 1),
('i6', 1),
('Model S', 2),
('Model X', 2),
('Model 3', 2),
('Nova', 3);

INSERT INTO production_years (established_on, manufacturer_id)
VALUES
('1916-03-01'::DATE, 1),
('2003-01-01'::DATE, 2),
('1966-05-01'::DATE, 3)