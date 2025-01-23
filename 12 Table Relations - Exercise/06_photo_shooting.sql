CREATE TABLE customers(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(50),
    date DATE
);

CREATE TABLE photos(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    url TEXT,
    place VARCHAR(50),
    customer_id INT REFERENCES customers(id)
);

INSERT INTO customers (name, date)
VALUES
('Bella', '2022-03-25'::DATE),
('Philip', '2022-07-05'::DATE);

INSERT INTO photos (url, place, customer_id)
VALUES
('bella_1111.com', 'National Theatre',1),
('bella_1112.com', 'Largo',1),
('bella_1113.com', 'The View Restaurant',1),
('philip_1121.com', 'Old Town',2),
('philip_1122.com', 'Rowing Canal',2),
('philip_1123.com', 'Roman Theater',2)