# SSH Connection Between Docker Containers

Simple bash scripts to setup SSH connection between two Ubuntu Docker containers.

## Quick Start

```bash
# Make scripts executable
chmod +x *.sh

# Run setup
./setup-all.sh

# Connect to server
./connect.sh
```

## Files

- `setup-all.sh` - Setup both server and client automatically
- `setup-server.sh` - Setup SSH server container
- `setup-client.sh` - Setup SSH client container
- `connect.sh` - Connect from client to server
- `cleanup.sh` - Remove all containers

## Manual Steps

### 1. Setup Server
```bash
./setup-server.sh
```

### 2. Setup Client
```bash
./setup-client.sh
```

### 3. Connect
```bash
./connect.sh
# Password: root
```

## Credentials

- **Username:** root
- **Password:** root

## What Gets Created

- **ssh-server** container with OpenSSH server
- **ssh-client** container with OpenSSH client
- **server_ip.txt** file with server IP address

## Manual Connection

```bash
# Get server IP
SERVER_IP=$(cat server_ip.txt)

# Connect from client
docker exec -it ssh-client ssh root@$SERVER_IP
```

## Cleanup

```bash
./cleanup.sh
```

## Troubleshooting

### Permission denied when running scripts
```bash
chmod +x *.sh
```

### SSH connection refused
```bash
# Restart SSH on server
docker exec ssh-server service ssh start
```

### Reset password
```bash
docker exec ssh-server bash -c "echo 'root:root' | chpasswd"
```

## What This Does

1. Creates two Ubuntu containers (server and client)
2. Installs OpenSSH server on server container
3. Installs OpenSSH client on client container
4. Configures SSH to allow root login with password
5. Sets root password to "root"
6. Starts SSH service on server
7. Saves server IP to file
8. You can then SSH from client to server

## Architecture

```
┌─────────────────┐         ┌─────────────────┐
│   ssh-client    │         │   ssh-server    │
│                 │  SSH    │                 │
│  openssh-client ├────────>│  openssh-server │
│                 │         │  Port 22        │
│                 │         │  User: root     │
└─────────────────┘         └─────────────────┘
```

---

**Simple and straightforward setup for learning Docker networking and SSH!**

