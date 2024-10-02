#!/bin/bash

sudo mkdir -p /home/logs
sudo chown -R aral:aral /home/logs

java -jar /home/aral/IdeaProjects/devopsForApiTesting/target/devopsForApiTesting-0.0.1-SNAPSHOT.jar > /home/logs/app.log 2>&1 &

LOGROTATE_CONF="/etc/logrotate.d/devopsapi"

sudo tee $LOGROTATE_CONF > /dev/null <<EOF
/home/logs/app.log {
    size 1M
    rotate 3
    compress
    copytruncate
    postrotate
        echo "Log rotated at \$(date)" >> /home/log_rotates.log
    endscript
}
EOF

# Принудительная ротация для теста
sudo logrotate -f $LOGROTATE_CONF
