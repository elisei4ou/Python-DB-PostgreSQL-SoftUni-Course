CREATE TABLE countries(
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    continent VARCHAR(40) NOT NULL,
    currency VARCHAR(5)
);

CREATE TABLE categories(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE actors(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    height INT,
    awards INT NOT NULL DEFAULT 0 CHECK ( awards >= 0 ),
    country_id INT REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE productions_info(
    id SERIAL PRIMARY KEY,
    rating DECIMAL(4, 2) NOT NULL,
    duration INT NOT NULL CHECK ( duration > 0 ),
    budget DECIMAL(10, 2),
    release_date DATE NOT NULL,
    has_subtitles BOOLEAN DEFAULT FALSE NOT NULL ,
    synopsis TEXT
);

CREATE TABLE productions(
    id SERIAL PRIMARY KEY,
    title VARCHAR(70) NOT NULL UNIQUE,
    country_id INT REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    production_info_id INT REFERENCES productions_info(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL UNIQUE
);

CREATE TABLE productions_actors(
    production_id INT REFERENCES productions(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    actor_id INT REFERENCES actors(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,

    PRIMARY KEY (production_id, actor_id)
);

CREATE TABLE categories_productions(
    category_id INT REFERENCES categories(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    production_id INT REFERENCES productions(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,

    PRIMARY KEY (production_id, category_id)
);