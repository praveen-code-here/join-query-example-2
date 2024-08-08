CREATE DATABASE dep12_join_example_2;

USER dep12_join_example_2;


CREATE TABLE customer
(
    id   VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

create table "user"(
                       username varchar(100) primary key ,
                       name varchar(200),
                       password varchar(300)
);