-- games table
CREATE TABLE games (
    id INTEGER PRIMARY KEY,
    name TEXT,
    author_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(id)
);

-- authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT
);
