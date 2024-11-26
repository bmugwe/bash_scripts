#!/bin/bash


# variables
BACKUP_DIR="/opt/backups"
REMOTE_USER="bmugwe"
REMOTE_HOST=""
REMOTE_PORT=""
REMOTE_DIR=""


# Latest backup
LATEST_BACKUP=$(ls -t $BACKUP_DIR | grep "dhis2_dump_" | head -n 1)

# SCP tp remote server

scp -P $REMOTE_PORT "$BACKUP_DIR/$LATEST_BACKUP" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

echo "Backup $LATEST_BACKUP transefered to $REMOTE_USER@$REMOTE_HOST"