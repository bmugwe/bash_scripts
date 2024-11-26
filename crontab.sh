
# 0 2 * * 5: The cron job will run at 2:00 AM on Friday (5 is Friday in cron syntax).
0 2 * * 5 /opt/scripts/db_backup.sh


# 0 4 * * 5: The cron job will run at 4:00 AM on Friday (5 is Friday in cron syntax).
0 4 * * 5 /opt/scripts/scp_to_back_server.sh