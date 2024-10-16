create database Pizza_Sales_db_new;

use Pizza_Sales_db_new;

-- Orders table creation
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    date DATE,
    time TIME
);

describe orders;

alter table orders
drop primary key;

alter table orders
add constraint primary key(order_id);

-- Order Details table creation
CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id INT,
    quantity INT,
    constraint c_fk1 FOREIGN KEY (order_id) REFERENCES orders(order_id),
    constraint c_fk2 FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

-- Pizza Types table creation
CREATE TABLE pizza_types (
    pizza_type_id INT PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);

-- Pizzas table creation
CREATE TABLE pizzas (
    pizza_id INT PRIMARY KEY,
    pizza_type_id INT,
    size VARCHAR(10),
    price DECIMAL(10, 2),
    constraint l_fk1 FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);