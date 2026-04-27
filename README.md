# Minecraft Fabric Server for Raspberry Pi 5

A complete, easy-to-use installation script for setting up a Minecraft 1.26.2 Fabric server on a Raspberry Pi 5 with 8GB RAM.

## Features

✅ Automated Fabric server setup  
✅ Interactive version selection (1.26.2, 1.26.1, 1.26.0, 1.25.4)  
✅ Java 25 automatic installation  
✅ Optimized JVM arguments for Raspberry Pi 5  
✅ Interactive server configuration  
✅ Mod support via Fabric  
✅ Automatic EULA handling  

## Prerequisites

- Raspberry Pi 5 with 8GB RAM
- Raspberry Pi OS (Bullseye or later) installed
- Internet connection
- SSH access or terminal access to your Pi

## Installation

### Quick Start

1. **On your Raspberry Pi**, clone this repository or download the files:
```bash
git clone https://github.com/yourusername/minecraft-fabric-server.git
cd minecraft-fabric-server
```

2. **Run the installer**:
```bash
sudo ./install
```

3. **Follow the interactive prompts**:
   - Select Minecraft version (default: 1.26.2)
   - Agree to EULA
   - Configure server name, player count, and port

4. **Start the server**:
```bash
cd /opt/minecraft-server
./start.sh
```

5. **Connect to your server** in Minecraft:
   - Server Address: `YOUR_PI_IP_ADDRESS:25565`
   - Find your Pi's IP: `hostname -I`

## Server Management

### Start the Server
```bash
cd /opt/minecraft-server
./start.sh
```

### Stop the Server
```bash
pkill -f server.jar
```

### View Server Logs
```bash
tail -f /opt/minecraft-server/logs/latest.log
```

### Add Mods
1. Download Fabric-compatible mods
2. Place `.jar` files in `/opt/minecraft-server/mods/`
3. Restart the server

### Edit Server Configuration
```bash
nano /opt/minecraft-server/server.properties
```

Common settings:
- `max-players`: Maximum number of players
- `difficulty`: 0=Peaceful, 1=Easy, 2=Normal, 3=Hard
- `pvp`: Enable/disable PvP (true/false)
- `gamemode`: survival, creative, adventure, spectator
- `view-distance`: Render distance (8-32, lower = better performance)

## Memory Configuration

The startup script allocates:
- **Minimum**: 4GB (-Xms4G)
- **Maximum**: 6GB (-Xmx6G)

For the 8GB Raspberry Pi 5, this leaves 2GB for the OS.

To adjust, edit `start.sh`:
```bash
# Change these values:
java -Xmx6G -Xms4G -XX:+UseG1GC ...
     ^^^^^^  ^^^^^^
     max    min
```

**Recommended for Pi 5 8GB**: 6G max, 4G min (current setting)

## Java Version

This script installs **Java 25** (latest available on Raspberry Pi OS).

To check installed Java version:
```bash
java -version
```

## Troubleshooting

### Server won't start
- Check Java is installed: `java -version`
- Verify you agreed to EULA: `cat /opt/minecraft-server/eula.txt`
- Check permissions: `ls -la /opt/minecraft-server/start.sh` (should show `x`)
- View logs: `tail -f /opt/minecraft-server/logs/latest.log`

### Poor performance
- Lower `view-distance` in server.properties (8-10 for Pi)
- Reduce `max-players`
- Increase `simulation-distance`
- Use only lightweight mods

### Can't connect from outside network
- Check firewall allows port 25565
- Port forward your router (advanced)
- Use ngrok or similar tunnel for external access

## Fabric Resources

- **Official Site**: https://fabricmc.net/
- **Mod Repository**: https://modrinth.com/
- **Documentation**: https://fabricmc.net/wiki/

## First Run Checklist

- [ ] Raspberry Pi running Raspberry Pi OS
- [ ] SSH access to Pi confirmed
- [ ] Ran `sudo ./install`
- [ ] Selected Minecraft version
- [ ] Agreed to EULA
- [ ] Configured server settings
- [ ] Started server with `./start.sh`
- [ ] Connected from Minecraft client

## Performance Tips

1. **Lower view distance**: 8-10 blocks for Pi 5
2. **Disable unnecessary features**: command blocks, etc.
3. **Use lightweight mods**: Avoid physics-heavy mods
4. **Regular backups**: Backup `/opt/minecraft-server/world`
5. **Monitor system**: Use `top` or `htop` to check CPU/RAM usage

## License

MIT

## Support

For issues or questions:
1. Check the logs: `tail -f /opt/minecraft-server/logs/latest.log`
2. Verify EULA: `cat /opt/minecraft-server/eula.txt`
3. Ensure Java is installed: `java -version`

## Future Enhancements

Planned features:
- Automatic backups
- Systemd service wrapper
- Web console
- Automatic restart on crash
- Multi-version support

---

Happy mining! ⛏️
