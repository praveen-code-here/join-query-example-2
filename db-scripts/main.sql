CREATE DATABASE dep12_join_example_2;

USE
dep12_join_example_2;

CREATE TABLE customer
(
    id   VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE item
(
    bar_code    VARCHAR(50) PRIMARY KEY,
    description VARCHAR(150)  NOT NULL,
    stock       INT           NOT NULL,
    price       DECIMAL(10, 2) NOT NULL
);

CREATE TABLE user
(
    username VARCHAR(100) PRIMARY KEY,
    name     VARCHAR(100) NOT NULL,
    password VARCHAR(300) NOT NULL
);
INSERT INTO "user" (username, name, password) VALUES
                                                  ('john_doe', 'John Doe', 'password123'),
                                                  ('jane_smith', 'Jane Smith', 'securepassword456'),
                                                  ('alice_jones', 'Alice Jones', 'password789'),
                                                  ('bob_brown', 'Bob Brown', 'passw0rd101112'),
                                                  ('charlie_black', 'Charlie Black', 'mypassword131415');
create table "user"(
                       username varchar(100) primary key ,
                       name varchar(200),
                       password varchar(300)
);

CREATE TABLE `order`
(
    id          VARCHAR(10) Primary Key,
    date        DATE         NOT NULL,
    customer_id VARCHAR(10)  NOT NULL,
    username    VARCHAR(100) NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customer (id),
    CONSTRAINT fk_user FOREIGN KEY (username) REFERENCES user (username)
);

CREATE TABLE order_detail
(
    order_id      VARCHAR(10)    NOT NULL,
    item_code    VARCHAR(50)    NOT NULL,
    qty           INT            NOT NULL,
    price         DECIMAL(10, 2) NOT NULL,
    CONSTRAINT pk_order_detail PRIMARY KEY (order_id, item_bar_code),
    CONSTRAINT fk_order FOREIGN KEY (order_id) REFERENCES `order` (id),
    CONSTRAINT fk_item_bar_code FOREIGN KEY (item_code) REFERENCES item (bar_code)
);

INSERT INTO order_item (order_id, bar_code, price, qty) VALUES ('OD001', 'IC001', 4000.25, 40),
                                                               ('OD002', 'IC007', 2000.25, 60),
                                                               ('OD002', 'IC005', 7000.25, 30),
                                                               ('OD008', 'IC004', 4900.25, 20),
                                                               ('OD003', 'IC004', 7500.25, 10),
                                                               ('OD005', 'IC007', 2900.25, 90),
                                                               ('OD005', 'IC006', 1100.25, 80),
                                                               ('OD006', 'IC005', 5000.25, 30),
                                                               ('OD009', 'IC005', 8800.25, 50),
                                                               ('OD008', 'IC002', 2600.25, 10);