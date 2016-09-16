#!/bin/bash
disable_snmp()
{
/usr/bin/expect -c "

spawn ssh -q -o StrictHostKeyChecking=no $1@$3

expect \"*assword\"
send \"$2\r\"

expect \"/admin1->\"
send \"racadm set idrac.snmp.agentcommunity 'pindropsecurity'\r\"

expect \"/admin1->\"
send \"racadm set idrac.snmp.agentenable 0 \r\"

expect \"/admin1->\"
close
"
}

disable_snmp root calvin 10.20.11.46
