#!/bin/bash

. /root/Projects/CS126-Projects/functionlibrary.sh
trap trapforcrtc SIGINT

echo "Please enter your desired IP address"
read IPADDRESS

if check_ip "$IPADDRESS" ;then
	echo "This is the IP address you have entered "$IPADDRESS""
else
{
	echo "You have not entered an IP address. Exiting now"
	exit 1
}
fi	 
#if [[ -z $IPADDRESS ]]
#then 
#{
#	echo "You did not enter an IP address"
#	exit 1
#}	 
#else 
#	check_ip $IPADDRESS
#fi

echo "Please enter your desired Netmask"
read NETMASK

if check_ip "$NETMASK" ;then
	echo "This is the Netmask you have entered: "$NETMASK""
else
{
	echo "You did not enter a valid Netmask. Exiting now."
	exit 1
}


#if [[ -z $NETMASK ]]
#then 
#{
#	echo "You did not enter a Netmask"
#	exit 1	
#}
#else 
#	check_ip $NETMASK
#fi

echo "What Nameserver would you like to use?"
read NAMESERVER

#if [[ -z $NAMESERVER ]]
#then
#{
#	echo "You did not enter a Nameserver"
#	exit 1
#}
#fi

echo "What is your desired default gateway?"
read GATEWAY

if check_ip "$GATEWAY" ;then
	echo "This is the Gateway you have entered: "$GATEWAY""
else 
{
	echo "You did not enter a valid Gateway address. Exiting now"
	exit 1
}
#
#if [[ -z $GATEWAY ]]
#then
#{ 
#	echo "You did not enter a Gateway Address"
#	exit 1
#}
#else
#	check_ip $GATEWAY
#fi

ifconfig eth1 $IPADDRESS
ifconfig eth1 netmask $NETMASK

grep -v "$NAMESERVER" /etc/resolv.conf > tmp.resolv.conf
echo "nameserver" $NAMESERVER >> /tmp/resolv.conf
#cat /tmp/resolv/conf > /etc/resolv.conf


touch /tmp/ifcfg-eth1

  echo "# Created by Netwiz" >           /tmp/ifcfg-eth1
  echo 'NAME="eth1"'	     >>		 /tmp/ifcfg-eth1
  echo "ONBOOT=yes" 	     >>		 /tmp/ifcfg-eth1
  echo "NETBOOT=yes"	     >>		 /tmp/ifcfg-eth1
  echo "IPADDR="$IPADDRESS   >>		 /tmp/ifcfg-eth1
  echo "NETMASK="$NETMASK    >>		 /tmp/ifcfg-eth1
  echo "IPV6INIT=yes"	     >>		 /tmp/ifcfg-eth1
  echo "BOOTPROTO=none"      >>		 /tmp/ifcfg-eth1
  echo "TYPE=Ethernet"	     >>		 /tmp/ifcfg-eth1
  echo "DNS1="$NAMESERVER    >>          /tmp/ifcfg-eth1
  echo 'NM_CONTROLLED="no"'  >>		 /tmp/ifcfg-eth1

#mv /tmp/ifcfg-eth1 /etc/sysconfig/network-scripts


#cleanup
