#!/bin/bash

until pg_isready -U gilded -d gilded_rose; do
  sleep 1
done

eval "$(rbenv init -)"

piggly trace

echo "Running all pgTAP tests..."
pg_prove -U gilded -d gilded_rose -v /tests/*.sql 2> trace.txt

piggly untrace

piggly report -f trace.txt -c /piggly/cache/ -o /piggly/reports
