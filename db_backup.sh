#!/bin/bash

DB_NAME="dhis2"

DATE = $(date +"%Y-%M-%d")
OUTPUT_FILE="dhis2_dump_${DATE}.sql.gz"

pg_dump -d $DB_NAME | gzip > /opt/backups/$OUTPUT_FILE


echo "Backup completed: /opt/backups/$OUTPUT_FILE"