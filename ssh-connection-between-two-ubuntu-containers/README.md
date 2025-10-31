# SSH Connection Between Two Ubuntu Containers

This folder contains bash scripts to automate the setup of SSH connection between two Docker containers.

## 📁 Files Overview

| File | Description |
|------|-------------|
| `0-setup-all.sh` | **Master script** - Runs everything automatically |
| `1-setup-server.sh` | Creates and configures ssh-server container |
| `2-setup-client.sh` | Creates and configures ssh-client container |
| `3-connect-to-server.sh` | Connect from client to server via SSH |
| `4-copy-directory-example.sh` | Demo: Copy directory from server to client |
| `5-setup-passwordless-ssh.sh` | Setup SSH keys for passwordless login |
| `6-cleanup.sh` | Remove all containers and cleanup |

## 🚀 Quick Start

### Option 1: Automatic Setup (Recommended)
```bash
cd ssh-connection-between-two-ubuntu-container
chmod +x *.sh
./0-setup-all.sh
```

This will set up everything automatically.

### Option 2: Step-by-Step Setup
```bash
chmod +x *.sh
./1-setup-server.sh
./2-setup-client.sh
./3-connect-to-server.sh
```

## 📝 Default Credentials

- **Username:** `root`
- **Password:** `password123`

## 🔧 What Gets Created

### SSH Server Container
- **Name:** `ssh-server`
- **OS:** Ubuntu
- **Services:** OpenSSH Server
- **IP:** Dynamically assigned (saved to `server_ip.txt`)

### SSH Client Container
- **Name:** `ssh-client`
- **OS:** Ubuntu
- **Services:** OpenSSH Client

## 💡 Usage Examples

### Connect to Server
```bash
# Option 1: Use the script
./3-connect-to-server.sh

# Option 2: Manual connection
docker exec -it ssh-client bash
ssh root@<SERVER_IP>
```

### Copy Files
```bash
# From host to server
docker cp myfile.txt ssh-server:/tmp/

# From server to client (use the script)
./4-copy-directory-example.sh

# Manual copy from client
docker exec -it ssh-client bash
scp -r root@<SERVER_IP>:/path/to/dir /local/path/
```

### Run Commands on Server from Client
```bash
docker exec -it ssh-client bash
ssh root@<SERVER_IP> "ls -la /tmp"
ssh root@<SERVER_IP> "df -h"
ssh root@<SERVER_IP> "hostname"
```

## 🔐 Setup Passwordless SSH

```bash
./5-setup-passwordless-ssh.sh
```

After running this, you can SSH without entering a password.

## 🧹 Cleanup

```bash
./6-cleanup.sh
```

This removes both containers and temporary files.

## 🛠️ Troubleshooting

### Permission Denied (Script Execution)
```bash
chmod +x *.sh
```

### Connection Refused
If you get "Connection refused":
```bash
# Restart SSH service on server
docker exec -it ssh-server bash
service ssh start
service ssh status
```

### Permission Denied (SSH)
If password doesn't work:
```bash
# Reset password on server
docker exec -it ssh-server bash
echo 'root:password123' | chpasswd
```

### Container Not Found
```bash
# Check if containers exist
docker ps -a

# Recreate them
./1-setup-server.sh
./2-setup-client.sh
```

## 📚 What You Can Learn

- Docker container networking
- SSH server configuration
- Secure remote access
- File transfers between containers
- SSH key-based authentication
- Container-to-container communication
- Bash scripting automation

## 🎯 Next Steps

After mastering this setup, try:
1. Deploy a web application on ssh-server
2. Use SSH tunneling (port forwarding)
3. Set up automated backups
4. Create a CI/CD pipeline
5. Practice remote debugging

## ⚠️ Notes

- Containers run on the default Docker bridge network
- Server IP is dynamically assigned (check `server_ip.txt`)
- Containers are created with `-itd` flag for interactive + detached mode
- SSH runs on default port 22 inside containers
- Scripts must be made executable with `chmod +x` before running

## 🔗 Related Concepts

- **Docker Networking:** Containers communicate via bridge network
- **SSH Protocol:** Secure shell for remote access
- **SCP/SFTP:** Secure file transfer protocols
- **SSH Keys:** Public-key cryptography for authentication

## 📋 Script Details

### 1-setup-server.sh
- Creates Ubuntu container named `ssh-server`
- Installs OpenSSH server, vim, nano
- Configures SSH for root login with password
- Sets root password to `password123`
- Starts SSH service
- Saves server IP to `server_ip.txt`

### 2-setup-client.sh
- Creates Ubuntu container named `ssh-client`
- Installs OpenSSH client
- Ready to connect to server

### 3-connect-to-server.sh
- Reads server IP from `server_ip.txt`
- Opens interactive SSH session from client to server
- You'll be prompted for password: `password123`

### 4-copy-directory-example.sh
- Creates test directory on server
- Installs `sshpass` for automated authentication
- Copies directory from server to client using SCP
- Verifies the copy was successful

### 5-setup-passwordless-ssh.sh
- Generates SSH key pair on client
- Copies public key to server
- Enables passwordless SSH authentication

### 6-cleanup.sh
- Stops both containers
- Removes both containers
- Deletes `server_ip.txt`

---

**Created for:** Docker SSH Practice  
**Platform:** macOS/Linux (Bash scripts)  
**Docker:** Required  
**OS Images:** Ubuntu latest

