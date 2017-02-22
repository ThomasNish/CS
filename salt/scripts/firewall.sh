#!/bin/bash


# Allow SSH 

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# Allow Salt 

iptables -A INPUT -p tcp --dport 4505 -j ACCEPT 
iptables -A INPUT -i eth0 -p tcp --dport 4505 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 4505 -m state --state ESTABLISHED -j ACCEPT

# Allow DNS 

iptables -A INPUT -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 53 -m state --state ESTABLISHED -j ACCEPT

# Allow Web 

iptables -A INPUT -p tcp --dport 80 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Allow Samba 

iptables -A INPUT -p tcp --dport 445 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 445 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 445 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -p udp --dport 445 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 445 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 445 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -p udp --dport 137 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 137 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 137 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -p udp --dport 138 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 138 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --sport 138 -m state --state ESTABLISHED -j ACCEPT

iptables -A INPUT -p tcp --dport 139 -i eth0 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --dport 139 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 139 -m state --state ESTABLISHED -j ACCEPT

# Drops everything else

iptables -A INPUT -j DROP
