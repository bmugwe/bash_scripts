#!/bin/bash

DB_NAME="dhis2"
DB_USER="dhis"
DB_PASSWORD="xxxxxx"

DATE=$(date +"%Y-%M-%d")
OUTPUT_FILE="dhis2_dump_${DATE}.sql.gz"
LOG_FILE="/var/log/dhis2_backup_${DATE}.log"
EXLUDED_TABLES="analytics_*"

# exec > >(tee -a "$LOG_FILE") 2>&1
# Above commented out because of error


export PGPASSWORD=$DB_PASSWORD


# added -h 127.0.0.1 to overcome peer authentication failing
if ! pg_dump -U $DB_USER -d $DB_NAME -h 127.0.0.1 --exclude-table=$EXLUDED_TABLES | gzip > /opt/backups/$OUTPUT_FILE; then
    echo "Error Backing up the database"
    exit 1
fi

echo "Backup completed: /opt/backups/$OUTPUT_FILE"

unset PGPASSWORD