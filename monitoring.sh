#!/bin/bash

PROC="test"
URL="https://test.com/monitoring/test/api"
LOG="/var/log/monitoring.log"
STATE="/var/run/monitoring.pid"

PID=$(pgrep -xo $PROC)

if [ -n "$PID" ]; then
    if [ -f "$STATE" ]; then
        OLD=$(cat $STATE)
        if [ "$OLD" != "$PID" ]; then
            echo "$(date '+%F %T') | $PROC перезапущен ($OLD -> $PID)" >> $LOG
        fi
    fi
    echo $PID > $STATE

    curl -fs --max-time 5 $URL >/dev/null
    if [ $? -ne 0 ]; then
        echo "$(date '+%F %T') | Сервер мониторинга недоступен" >> $LOG
    fi
fi