-- games table
CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name TEXT,
    genre TEXT,
    author TEXT,
    source TEXT,
    label TEXT,
    published_date DATE,
    archived boolean,
    multiplayer boolean,
    last_played_at DATE,
);

-- authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    name TEXT
);
