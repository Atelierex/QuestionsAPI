DROP DATABASE IF EXISTS questions;

CREATE DATABASE questions;

USE questions;

CREATE TABLE product (
  /* Describe your table here.*/
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR (50) NOT NULL,
  PRIMARY KEY (id)
);

/* Create other tables and define schemas for them here! */
CREATE TABLE question (
  id INT NOT NULL AUTO_INCREMENT,
  product_id INT NOT NULL,
  body TEXT NOT NULL,
  date_written DATE NOT NULL,
  asker_name VARCHAR(50),
  asker_email TEXT,
  reported BOOLEAN,
  helpful INT,
  PRIMARY KEY (id)
  -- FOREIGN KEY (product_id) REFERENCES product(id)
);

LOAD DATA LOCAL INFILE './csv/test.csv'
INTO TABLE question
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,product_id,body,@date_written,asker_name,asker_email,reported,helpful)
SET date_written = from_unixtime(@date_written/1000);
