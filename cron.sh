#!/usr/bin/env bash

if [ -z "$CRON" ]
  then
    echo "INFO: No CRON setting found. Replacing SA now."
    /app/replace.sh $PREFIX $MAX_NUMBER
  else
    # Setup cron schedule
    echo "$CRON /app/replace.sh $CONFIG_DIR $PREFIX $MAX_NUMBER >> /var/log/replace.log 2>&1" > /tmp/crontab.tmp
    crontab /tmp/crontab.tmp
    crontab -l
    rm /tmp/crontab.tmp
    # Start cron
    echo "INFO: Starting cron ..."
    touch /var/log/crond.log
    cron -f &
    echo "INFO: cron started"
    tail -F /var/log/crond.log /var/log/replace.log
  fi
fi
