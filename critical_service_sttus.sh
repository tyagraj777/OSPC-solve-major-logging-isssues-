#Objective This script checks the status of critical services and ensures they are functioning correctly.

#!/bin/bash

SERVICES=("nova-compute" "neutron-server" "cinder-volume" "glance-api")
LOG_FILE="/var/log/service_health_check.log"

echo "$(date): Starting health checks" >> $LOG_FILE

for SERVICE in "${SERVICES[@]}"; do
  systemctl is-active --quiet $SERVICE
  if [ $? -ne 0 ]; then
    echo "Service $SERVICE is down. Restarting..." | tee -a $LOG_FILE
    systemctl restart $SERVICE
  else
    echo "Service $SERVICE is healthy." >> $LOG_FILE
  fi
done
echo "$(date): Health check completed." >> $LOG_FILE
