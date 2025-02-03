CREATE TABLE categories(
    id   SERIAL primary key,
    name varchar(50) not null
);

create table addresses(
    id serial primary key,
    street_name varchar(100) not null,
    street_number int not null check (street_number > 0),
    town varchar(30) not null,
    country varchar(50) not null,
    zip_code int not null check (zip_code > 0)
);

create table publishers(
    id serial primary key,
    name varchar(30) not null,
    address_id int references addresses(id) on update cascade  on delete cascade not null,
    website varchar(40),
    phone varchar(20)
);

create table players_ranges(
    id serial primary key,
    min_players int not null check ( min_players > 0 ),
    max_players int not null check ( max_players > 0 )
);

create table creators(
    id serial primary key,
    first_name varchar(30) not null ,
    last_name varchar(30) not null ,
    email varchar(30) not null
);

create table board_games(
    id serial primary key,
    name varchar(30) not null,
    release_year int not null check ( release_year > 0 ),
    rating numeric(100, 2) not null,
    category_id int references categories(id) on update cascade on delete cascade not null,
    publisher_id int references publishers(id) on update cascade on delete cascade not null,
    players_range_id int references players_ranges(id) on update cascade on delete cascade not null
);

create table creators_board_games
(
    creator_id    int references creators (id) on update cascade on delete cascade   not null,
    board_game_id int references board_games (id) on update cascade on delete cascade not null
)