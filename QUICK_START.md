# Quick Start Guide

## On Your Raspberry Pi (via SSH)

```bash
# Download the installer
git clone https://github.com/yourusername/minecraft-fabric-server.git
cd minecraft-fabric-server

# Run installer (takes 2-5 minutes)
sudo ./install

# Start server
cd /opt/minecraft-server
./start.sh
```

## In Minecraft Client

1. Add Server
2. Server Address: `YOUR_PI_IP:25565`
3. Find IP: `hostname -I` (on Pi)

## Common Commands

```bash
# Stop server
pkill -f server.jar

# View logs
tail -f /opt/minecraft-server/logs/latest.log

# Backup world
cd /opt/minecraft-server && ../scripts/backup.sh

# Add mods
cp my-mod.jar /opt/minecraft-server/mods/
./start.sh  # restart
```

## Auto-Start on Boot (Optional)

```bash
sudo cp minecraft-server.service /etc/systemd/system/
sudo systemctl enable minecraft-server
sudo systemctl start minecraft-server
sudo systemctl status minecraft-server
```

That's it! Happy mining! ⛏️
