CREATE DATABASE catalog_of_things;
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

-- create music_album table

CREATE TABLE music_album ( 
        id INTEGER GENERATED ALWAYS AS IDENTITY, 
        publish_date DATE, 
        archived BOOLEAN, 
        on_spotify BOOLEAN, 
        genre_id INTEGER,
        CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id) ON DELETE CASCADE
    PRIMARY KEY(id) 
);

-- create genre table

CREATE TABLE genre (
        id INTEGER GENERATED ALWAYS AS IDENTITY,
        name VARCHAR(255) NOT NULL, 
       PRIMARY KEY(id) 
    );