#Objective Analyzes a crash dump using GDB and uploads it to OpenStack Object Storage.

#!/bin/bash

DUMP_FILE=$1
EXECUTABLE=$2
OS_CONTAINER="crash-dumps"
ANALYSIS_DIR="/tmp/analysis"
mkdir -p $ANALYSIS_DIR

# Analyze dump
gdb -batch -ex "bt full" -ex "quit" $EXECUTABLE $DUMP_FILE > $ANALYSIS_DIR/$(basename $DUMP_FILE).analysis

# Upload to OpenStack
openstack object create $OS_CONTAINER $ANALYSIS_DIR/$(basename $DUMP_FILE).analysis

echo "Crash dump analyzed and uploaded to OpenStack container $OS_CONTAINER."
