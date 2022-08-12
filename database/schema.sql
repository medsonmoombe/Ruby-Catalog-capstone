-- create books table

CREATE TABLE books {
  book_id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publisher VARCHAR(100),
  publish_date DATE,
  cover_state VARCHAR(10),
  FOREIGN KEY(book_id) REFERENCES item(id)
}

-- create labels table

CREATE TABLE labels {
  label_id IN PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR(100),
  color VARCHAR(50),
  items CHAR(100) [],
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES item(id)
}