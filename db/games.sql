DROP TABLE IF EXISTS games ;
DROP TABLE IF EXISTS publishers ;


CREATE TABLE publishers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE games (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  stock INT4,
  publisher_id INT8 REFERENCES publishers(id)
);
