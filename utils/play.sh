#!/usr/bin/env bash

DB_LOCATION=data.sqlite.example
sqlite3 -separator ',' $DB_LOCATION "select title,year,path||fn from movies where not seen and not removed" \
    | fzf -i -d, --with-nth=1,2 \
    | awk -F',' '{print $3}' \
    | mpv --playlist=-
