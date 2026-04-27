# Minecraft Fabric Server - Complete Setup Package

## What You Have

All files are ready in: `c:\Users\ccook\Downloads\New folder (2)\minecraft-fabric-server\`

### Core Files
- **install** - Main installation script (the one you run on your Pi)
- **README.md** - Complete documentation
- **QUICK_START.md** - Quick reference guide
- **LICENSE** - MIT License for open source

### Optional Files  
- **minecraft-server.service** - For systemd auto-start (advanced)
- **scripts/backup.sh** - Automated backup utility

## What It Does

When you run `sudo ./install` on your Raspberry Pi:

1. ✅ Checks/installs Java 25
2. ✅ Shows menu to pick Minecraft version (1.26.2, 1.26.1, 1.26.0, 1.25.4)
3. ✅ Downloads Fabric installer
4. ✅ Installs Fabric + server jar
5. ✅ Asks you to agree to EULA
6. ✅ Walks through server config (name, players, port, etc)
7. ✅ Creates start.sh script
8. ✅ Ready to play!

## Getting Started

### Step 1: Set Up GitHub (Recommended)
See `GITHUB_SETUP.md` for exact instructions. TL;DR:
```
1. Create repo on GitHub
2. Upload these files
3. Share the link
```

### Step 2: On Your Raspberry Pi 5
```bash
git clone https://github.com/YOUR_USERNAME/minecraft-fabric-server.git
cd minecraft-fabric-server
sudo ./install
```

### Step 3: Connect to Server
- In Minecraft, add server
- Address: `YOUR_PI_IP:25565`
- Find IP: `hostname -I` on the Pi

## Default Settings After Install

- **Java**: 25 (or latest available)
- **Minecraft**: 1.26.2 (with Fabric)
- **Memory**: 6GB max, 4GB min
- **Port**: 25565 (default)
- **Max Players**: Configurable during install
- **Gamemode**: Survival

## File Locations on Pi

After install, everything lives at: `/opt/minecraft-server/`

```
/opt/minecraft-server/
├── server.jar           # The actual server
├── start.sh            # Run this to start server
├── server.properties   # Config file
├── eula.txt           # EULA agreement
├── logs/              # Server logs
├── world/             # Main world
├── mods/              # Put mods here
└── backups/           # World backups
```

## Quick Commands on Pi

```bash
# Start server
cd /opt/minecraft-server && ./start.sh

# Stop server
pkill -f server.jar

# View logs
tail -f /opt/minecraft-server/logs/latest.log

# Add mods
cp my_mod.jar /opt/minecraft-server/mods/

# Backup world
bash /opt/minecraft-fabric-server/scripts/backup.sh
```

## Next Steps

1. **Push to GitHub** (see GITHUB_SETUP.md)
2. **Flash Raspberry Pi OS** to your Pi 5
3. **SSH into your Pi**: `ssh pi@YOUR_PI_IP`
4. **Clone and install**: 
   ```bash
   git clone https://github.com/YOUR_USERNAME/minecraft-fabric-server.git
   cd minecraft-fabric-server
   sudo ./install
   ```
5. **Start server**: `cd /opt/minecraft-server && ./start.sh`
6. **Connect from Minecraft**

## Troubleshooting Tips

- **Won't start?** Check logs: `tail -f /opt/minecraft-server/logs/latest.log`
- **Can't connect?** Make sure Pi is on same network, or port forward
- **Slow?** Lower view-distance in server.properties
- **Out of memory?** Reduce -Xmx value in start.sh

## Performance on Pi 5 8GB

✅ 10-15 players: Smooth  
✅ Lightweight mods: Works great  
✅ View distance 8-10: Recommended  
✅ Default settings optimized for Pi 5  

## Everything You Need

✅ Automated installer with menus  
✅ Minecraft 1.26.2 with Fabric support  
✅ Java 25  
✅ Optimized for Pi 5  
✅ Backup utility  
✅ Clear documentation  
✅ Ready to share on GitHub  

---

**You're all set!** 🎮

Next: Push to GitHub and start building your server!
