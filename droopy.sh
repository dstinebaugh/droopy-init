### BEGIN INIT INFO
# Provides:          droopy
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: droopy
# Description:       Starts the droopy python webserver in a screen session named droopy
### END INIT INFO

# Carry out specific functions when asked to by the system
case "$1" in
  start)
        echo "Running Droopy init"
        #!/bin/bash
        #Startup script for services on my cloud

        #Settings
        USERNAME='daniel'
        INVOCATION="python /usr/local/bin/droopy/droopy.py"
        HISTORY=1024
        SERVICE='droopy.py'

        if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
            echo "Droopy is already running!"
        else
            echo "Starting Droopy Server..."
            cd /home/daniel
            su - $USERNAME bash -c "cd /home/daniel/ && screen -h $HISTORY -dmS droopy $INVOCATION"
            sleep 7
            if pgrep -u $USERNAME -f droopy > /dev/null
            then
                echo "Droopy is now running."
            else
                echo "Error! Couldn't start Droopy!"
            fi
        fi

        echo "Script complete."

    ;;
  stop)
    echo "Stopping droopy"
    #!/bin/bash
    
    #Settings
    USERNAME='daniel'
    su - $USERNAME -c "screen -S droopy -p 0 -X quit"

    ;;
  *)
    echo "Usage: /etc/init.d/droopy {start|stop}"
    exit 1
    ;;
esac

exit 0