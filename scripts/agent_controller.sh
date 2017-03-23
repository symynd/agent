#!/bin/bash
#kconfig: 35 90 12
# description: Agent Installer Test

addLib(){
   
    if [[ -f "/etc/lsb-release" ]]
        then
            os="ubuntu"
        elif [[ -f "/etc/redhat-release" ]]
        then
            os="rpm"
            . /etc/init.d/functions
        elif [[ -f "/etc/debian_version" ]]
        then
            os="debian"
        
    fi
}



# Start the service AgentInstaller

          
# Get function from functions library
######################## . /etc/init.d/functions

start() {

echo ""
echo $"***********  agent_controller service started. Triggered from /etc/init.d/agent_controller.sh ***********"

command="/opt/infraguard/sbin/infraGuardMain"
#daemon "nohup $command >/dev/null 2>&1 &"
$command


}


stop(){
echo "Going to kill process agent_controller"
pkill  agent_controller.sh

}

### main logic ###
case "$1" in
  start)
        addLib
        start
        ;;
  stop)
        stop
        ;;

status)
        status agent_controller.sh
        ;;

 *)
        echo $"Usage: $0 {start|stop|status}"
        exit 1
esac

exit 0
os=""