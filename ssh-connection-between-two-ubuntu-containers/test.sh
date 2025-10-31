#!/bin/bash
# Test script to verify SSH setup works

echo "======================================"
echo "SSH Setup Test Script"
echo "======================================"
echo ""

# Step 1: Cleanup any existing containers
echo "Step 1: Cleaning up any existing containers..."
docker stop ssh-server ssh-client 2>/dev/null
docker rm ssh-server ssh-client 2>/dev/null
rm -f server_ip.txt
echo "✓ Cleanup complete"
echo ""

# Step 2: Setup server
echo "Step 2: Setting up SSH server..."
bash setup-server.sh
echo "✓ Server setup complete"
echo ""

# Step 3: Setup client
echo "Step 3: Setting up SSH client..."
bash setup-client.sh
echo "✓ Client setup complete"
echo ""

# Step 4: Verify containers
echo "Step 4: Verifying containers..."
echo "Running containers:"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"
echo ""

# Step 5: Get server IP
SERVER_IP=$(cat server_ip.txt)
echo "Step 5: Server IP: $SERVER_IP"
echo ""

# Step 6: Check SSH service
echo "Step 6: Checking SSH service on server..."
docker exec ssh-server service ssh status
echo ""

# Step 7: Test commands
echo "======================================"
echo "Setup Complete! Ready to test."
echo "======================================"
echo ""
echo "To connect to server, run:"
echo "  ./connect.sh"
echo ""
echo "Or manually:"
echo "  docker exec -it ssh-client ssh root@$SERVER_IP"
echo ""
echo "Password: root"
echo ""
echo "Once connected, try these commands:"
echo "  hostname"
echo "  whoami"
echo "  echo 'Hello from SSH!' > test.txt"
echo "  cat test.txt"
echo "  exit"
echo ""
echo "======================================"
echo "Press Enter to connect now, or Ctrl+C to exit..."
read -r

# Connect
echo "Connecting to server..."
echo "Password is: root"
echo ""
docker exec -it ssh-client ssh root@$SERVER_IP

