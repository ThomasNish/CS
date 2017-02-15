#!/bin/bash

/root/bin/firewall.sh
sleep 30
iptables -F
