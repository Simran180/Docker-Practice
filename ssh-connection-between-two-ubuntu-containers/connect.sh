#!/bin/bash
# Connect to server from client

SERVER_IP=$(cat server_ip.txt)

echo "Connecting to $SERVER_IP"
echo "Password: root"
echo ""

docker exec -it ssh-client ssh root@$SERVER_IP

