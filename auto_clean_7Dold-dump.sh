#Objective This script cleans up old crash dumps older than 7 days in /var/crash and logs the action.

#!/bin/bash

DUMP_DIR="/var/crash"
LOG_FILE="/var/log/cleanup_crash_dumps.log"

echo "$(date): Starting cleanup in $DUMP_DIR" >> $LOG_FILE
find $DUMP_DIR -type f -mtime +7 -exec rm -f {} \; -exec echo "Removed {}" >> $LOG_FILE \;
echo "$(date): Cleanup completed." >> $LOG_FILE
