#!/bin/bash
# Network Hardening Script for Edge Gateway
# Implements "Outbound-Only" policy by patching Docker iptables

echo "Applying DOCKER-USER restrictions..."
INTERFACE="enp1s0" # External Interface

# Block external access to IoT Ports
sudo iptables -I DOCKER-USER -i $INTERFACE -p tcp --dport 8883 -j DROP
sudo iptables -I DOCKER-USER -i $INTERFACE -p tcp --dport 5671 -j DROP
sudo iptables -I DOCKER-USER -i $INTERFACE -p tcp --dport 443 -j DROP

echo "Firewall rules applied. Verifying..."
sudo iptables -L DOCKER-USER -v -n
