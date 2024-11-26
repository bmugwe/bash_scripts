#!/bin/bash

DB_NAME="dhis2"
DB_USER="dhis"
DB_PASSWORD="xxxxxx"

DATE=$(date +"%Y-%M-%d")
OUTPUT_FILE="dhis2_dump_${DATE}.sql.gz"

export PGPASSWORD=$DB_PASSWORD


# added -h 127.0.0.1 to overcome peer authentication failing

pg_dump -U $DB_USER -d $DB_NAME -h 127.0.0.1 | gzip > /opt/backups/$OUTPUT_FILE


echo "Backup completed: /opt/backups/$OUTPUT_FILE"


unset PGPASSWORD