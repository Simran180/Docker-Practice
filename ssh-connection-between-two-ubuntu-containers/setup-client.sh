#!/bin/bash
# Simple SSH Client Setup

echo "Creating ssh-client container..."
docker run -d --name ssh-client ubuntu tail -f /dev/null

echo "Installing SSH client..."
docker exec ssh-client apt-get update
docker exec ssh-client apt-get install -y openssh-client

echo ""
echo "Client ready!"
echo ""

