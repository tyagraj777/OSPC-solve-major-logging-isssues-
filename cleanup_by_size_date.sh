#This script monitors and cleans up both logs and dumps beyond size and age limits.

#!/bin/bash

LOG_DIR="/var/log"
DUMP_DIR="/var/crash"
LOG_THRESHOLD=50  # Size in MB
DUMP_THRESHOLD=500  # Size in MB
LOG_FILE="/var/log/storage_cleanup.log"

# Clean logs exceeding size
echo "$(date): Cleaning large logs" >> $LOG_FILE
find $LOG_DIR -type f -size +${LOG_THRESHOLD}M -exec rm -f {} \; -exec echo "Removed log file {}" >> $LOG_FILE \;

# Clean dumps exceeding size
echo "$(date): Cleaning large dumps" >> $LOG_FILE
find $DUMP_DIR -type f -size +${DUMP_THRESHOLD}M -exec rm -f {} \; -exec echo "Removed dump file {}" >> $LOG_FILE \;

echo "$(date): Cleanup completed." >> $LOG_FILE
