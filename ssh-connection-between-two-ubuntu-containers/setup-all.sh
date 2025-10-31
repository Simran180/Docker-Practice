
# Server setup
echo "Step 1: Setting up SSH server..."
bash setup-server.sh

echo ""
echo "Step 2: Setting up SSH client..."
bash setup-client.sh

SERVER_IP=$(cat server_ip.txt)
echo "To connect, run: bash connect.sh"
echo "Password: root"


