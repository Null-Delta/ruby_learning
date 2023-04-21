CREATE TABLE IF NOT EXISTS student(
    id INT NOT NULL auto_increment PRIMARY KEY,
    lastname CHAR(255) NOT NULL,
    firstname CHAR(255) NOT NULL,
    patronymic CHAR(255) NOT NULL,
    git CHAR(255),
    phone CHAR(255),
    email CHAR(255),
    telegram CHAR(255)
);