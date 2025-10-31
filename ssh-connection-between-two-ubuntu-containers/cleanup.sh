#!/bin/bash
# Cleanup containers

echo "Stopping containers..."
docker stop ssh-server ssh-client 2>/dev/null

echo "Removing containers..."
docker rm ssh-server ssh-client 2>/dev/null

echo "Removing files..."
rm -f server_ip.txt

echo "Done!"
