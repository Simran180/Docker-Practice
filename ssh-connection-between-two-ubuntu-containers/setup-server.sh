#!/bin/bash
# Simple SSH Server Setup

echo "Creating ssh-server container..."
docker run -d --name ssh-server ubuntu tail -f /dev/null

echo "Installing SSH server..."
docker exec ssh-server apt-get update
docker exec ssh-server apt-get install -y openssh-server

echo "Configuring SSH..."
docker exec ssh-server mkdir /var/run/sshd
docker exec ssh-server bash -c "echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config"
docker exec ssh-server bash -c "echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config"

echo "Setting root password..."
docker exec ssh-server bash -c "echo 'root:root' | chpasswd"

echo "Starting SSH service..."
docker exec ssh-server service ssh start

echo "Getting server IP..."
SERVER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ssh-server)

echo ""
echo "Server ready!"
echo "IP: $SERVER_IP"
echo "Username: root"
echo "Password: root"
echo ""
echo "$SERVER_IP" > server_ip.txt

