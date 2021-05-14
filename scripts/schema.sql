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
  PRIMARY KEY (id),
  FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE answer (
  id INT NOT NULL AUTO_INCREMENT,
  question_id INT NOT NULL,
  body TEXT NOT NULL,
  date_written DATE NOT NULL,
  answerer_name VARCHAR(50),
  answerer_email TEXT,
  reported BOOLEAN,
  helpful INT,
  PRIMARY KEY (id),
  FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE photo (
  id INT NOT NULL AUTO_INCREMENT,
  answer_id INT NOT NULL,
  url TEXT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (answer_id) REFERENCES answer(id)
);


LOAD DATA LOCAL INFILE './csv/clean/product.csv'
INTO TABLE product
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE './csv/clean/questions.csv'
INTO TABLE question
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,product_id,body,@date_written,asker_name,asker_email,reported,helpful)
SET date_written = from_unixtime(@date_written/1000);


LOAD DATA LOCAL INFILE './csv/clean/answers.csv'
INTO TABLE answer
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id,question_id,body,@date_written,answerer_name,answerer_email,reported,helpful)
SET date_written = from_unixtime(@date_written/1000);

LOAD DATA LOCAL INFILE './csv/clean/answers_photos.csv'
INTO TABLE photo
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DELETE FROM photo WHERE url IS NULL;

/*  Execute this file from the command line by typing:
 *    mysql -u root < server/schema.sql
 *  to create the database and the tables.*/
/* select count(*) from answer for just the count
-- select * from answer limit 10;

-----------------------------------------------
mysqldump -u root -p catwalk > catwalk.sql
scp -i ~/Downloads/file.pem local_image_file user@ec2_elastic_ip:/home/user/images/
mysql -u root -p catwalk < catwalk.sql
mysql -u root -p questions < questions.sql to load the data when in file
*/