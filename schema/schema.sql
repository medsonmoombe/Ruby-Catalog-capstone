-- games table
CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    genre VARCHAR(255) NOT NULL,
    author_id INTEGER, CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE
    source VARCHAR(255) NOT NULL,
    label VARCHAR(255) NOT NULL,
    published_date DATE,
    archived boolean,
    multiplayer boolean,
    last_played_at DATE,
);

-- authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    fist_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
);
