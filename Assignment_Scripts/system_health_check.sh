#!/bin/bash

LOG_FILE="system_health.log"
TIMESTAMP=$(date)

# CPU usage
CPU_LOAD=$(wmic cpu get loadpercentage | grep -Eo '[0-9]+')

# Total and Free memory in KB
TOTAL_MEM=$(wmic OS get TotalVisibleMemorySize | grep -Eo '[0-9]+')
FREE_MEM=$(wmic OS get FreePhysicalMemory | grep -Eo '[0-9]+')


MEM_FREE_PERCENT=$((100 * FREE_MEM / TOTAL_MEM))

echo "[$TIMESTAMP] CPU: ${CPU_LOAD}% | Available Memory: ${MEM_FREE_PERCENT}%" >> $LOG_FILE

if [ "$CPU_LOAD" -gt 80 ] || [ "$MEM_FREE_PERCENT" -lt 20 ]; then
    echo "[$TIMESTAMP] Warning: High CPU or Low Memory!" >> $LOG_FILE
fi
