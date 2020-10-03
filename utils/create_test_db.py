#!/usr/bin/env python3

import sqlite3
from datetime import datetime
import sys

SCHEMA_SQL="schema.sql"

assert len(sys.argv) == 3

test_db = sys.argv[1]
total_files = int(sys.argv[2])

print("Bootstrapping db @ {}...".format(test_db))
conn = sqlite3.connect(test_db)
print("Creating schema...")

with open(SCHEMA_SQL, "r") as fp:
    conn.execute(fp.read())
    conn.commit()

conn.execute("DELETE FROM movies")
DATA = []
print("Populating db with {} movie(s)".format(total_files))
for i in range(total_files):
    _id = str(i)
    timestamp = datetime.now()
    DATA.append(("fn-"+_id, "title-"+_id, 2020, "/tmp/videodrome_data/", timestamp, timestamp))

conn.executemany('INSERT INTO movies (fn, title, year, path, created_at, updated_at) VALUES (?,?,?,?,?,?)', DATA)

conn.commit()
conn.close()

print("Test db created and populated")
