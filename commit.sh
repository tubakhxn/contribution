#!/bin/bash

START_DATE="2023-01-01"
END_DATE="2024-03-28"

while [ "$START_DATE" != "$END_DATE" ]; do
    echo "$START_DATE: Fake commit" >> history.txt
    git add history.txt
    GIT_COMMITTER_DATE="$START_DATE 12:00:00" GIT_AUTHOR_DATE="$START_DATE 12:00:00" git commit -m "Commit on $START_DATE"
    START_DATE=$(date -I -d "$START_DATE + 1 day")  # Move to the next day
done

git push origin main
