#!/bin/bash

/root/Projects/CS126-Projects/salt/scripts/firewall.sh
sleep 30
iptables -F
