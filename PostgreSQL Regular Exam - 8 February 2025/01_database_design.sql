CREATE TABLE brands(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE classifications(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    address VARCHAR(150) NOT NULL,
    phone VARCHAR(30) NOT NULL UNIQUE,
    loyalty_card BOOLEAN DEFAULT FALSE NOT NULL
);

CREATE TABLE items(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL CHECK ( quantity >=0 ),
    price DECIMAL(10, 2) NOT NULL CHECK ( price > 0.00 ),
    description TEXT,
    brand_id INT REFERENCES brands(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    classification_id INT REFERENCES classifications(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE orders(
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE reviews(
    customer_id INT REFERENCES customers(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    item_id INT REFERENCES items(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    rating DECIMAL(2, 1) NOT NULL DEFAULT 0.0 CHECK ( rating <= 10.0 ),

    PRIMARY KEY (customer_id, item_id)
);

CREATE TABLE orders_items(
    order_id INT REFERENCES orders(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    item_id INT REFERENCES items(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    quantity INT NOT NULL CHECK ( quantity >= 0 ),

    PRIMARY KEY (order_id, item_id)
);
