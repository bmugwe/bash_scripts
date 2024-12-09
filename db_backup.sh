#!/bin/bash

DB_NAME="dhis2"
DB_USER="dhis"
DB_PASSWORD="xxxxxx"

DHISPORT=8080
DHIS_USER=""
DHIS_PASSWORD=""

DATE=$(date +"%Y-%M-%d")
OUTPUT_FILE="dhis2_dump_${DATE}.sql.gz"
LOG_FILE="/var/log/dhis2_backup_${DATE}.log"

exec > > (tee -a"$LOG_FILE") 2>$1

export PGPASSWORD=$DB_PASSWORD

if ! curl -U "$DHIS_USER:$DHIS_PASSWORD" "localhost:$DHISPORT/api/40/maintenance?analyticsTableClear=true" -X POST ; then
    echo "Error clearing analytics"
    exit 1
fi

# wait for 3  minutes to clear the analytics
sleep 180

# added -h 127.0.0.1 to overcome peer authentication failing
if ! pg_dump -U $DB_USER -d $DB_NAME -h 127.0.0.1 | gzip > /opt/backups/$OUTPUT_FILE; then
    echo "Error Backing up the database"
    exit 1
fi


if ! curl -U "$DHIS_USER:$DHIS_PASSWORD" "localhost:$DHISPORT/api/40/resourceTables/analytics" -X POST ; then
    echo "Error Running analytics"
    exit 1
fi

echo "Backup completed: /opt/backups/$OUTPUT_FILE"

unset PGPASSWORD