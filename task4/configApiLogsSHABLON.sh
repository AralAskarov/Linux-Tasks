#!/bin/bash                                                                 
  
sudo mkdir -p /home/logs
sudo chown -R "yourname":"yourname" /home/logs
  
  java -jar "path_to_your_jar" > /home/logs/app.log 2>&1 &
  
  LOGROTATE_CONF="/etc/logrotate.d/app"
  
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
