create table movies(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fn TEXT NOT NULL,
    title TEXT,
    year INTEGER,
    seen BOOLEAN DEFAULT 0,
    removed BOOLEAN DEFAULT 0,
    path TEXT NOT NULL,
    created_at timestamp DEFAULT current_timestamp,
    updated_at timestamp DEFAULT current_timestamp,
    UNIQUE(fn, path)
);
