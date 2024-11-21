#Objective This script compresses large dumps periodically to reduce I/O and space usage.

#!/bin/bash

DUMP_DIR="/var/crash"
LOG_FILE="/var/log/compress_crash_dumps.log"

find $DUMP_DIR -type f -name "*.dump" -size +100M -exec gzip {} \; -exec echo "$(date): Compressed {}" >> $LOG_FILE \;
echo "$(date): Compression run completed." >> $LOG_FILE
