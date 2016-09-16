#!/usr/bin/expect
log_user 1
set username [lindex $argv 0]
set password [lindex $argv 1]
set hostname [lindex $argv 2]

if {[llength $argv] == 0} {
  send_user "Usage: scriptname username \'password\' hostname\n"
  exit 1
}

send_user "\n#####\n# $hostname\n#####\n"

spawn ssh -q -o StrictHostKeyChecking=no $username@$hostname

expect "*assword"
send "$password\r"

expect "/admin1->"
send "racadm set idrac.snmp.agentcommunity \"pindropsecurity\"\r"

expect "/admin1->"
send "racadm set idrac.snmp.agentenable 0 \r"

expect "/admin1->"
close
