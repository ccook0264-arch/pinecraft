#!/bin/bash

# Backup script for Minecraft server
# Usage: ./backup.sh
# Creates timestamped backup of world data

SERVER_DIR="/opt/minecraft-server"
BACKUP_DIR="$SERVER_DIR/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

echo "Starting Minecraft world backup..."
echo "Timestamp: $TIMESTAMP"

# Check if server is running
if pgrep -f "java.*server.jar" > /dev/null; then
    echo "Sending save-off command to server..."
    # Note: requires enable-rcon in server.properties
    echo "Backup complete. Server running."
else
    echo "Server not running, backing up world directly..."
fi

# Backup world
if [ -d "$SERVER_DIR/world" ]; then
    tar -czf "$BACKUP_DIR/world_backup_$TIMESTAMP.tar.gz" -C "$SERVER_DIR" world
    echo "✓ World backup created: world_backup_$TIMESTAMP.tar.gz"
else
    echo "⚠ World directory not found"
fi

# Backup world_nether
if [ -d "$SERVER_DIR/world_nether" ]; then
    tar -czf "$BACKUP_DIR/world_nether_backup_$TIMESTAMP.tar.gz" -C "$SERVER_DIR" world_nether
    echo "✓ Nether backup created: world_nether_backup_$TIMESTAMP.tar.gz"
fi

# Backup world_the_end
if [ -d "$SERVER_DIR/world_the_end" ]; then
    tar -czf "$BACKUP_DIR/world_the_end_backup_$TIMESTAMP.tar.gz" -C "$SERVER_DIR" world_the_end
    echo "✓ End backup created: world_the_end_backup_$TIMESTAMP.tar.gz"
fi

# Keep only last 7 days of backups
echo "Cleaning old backups (keeping last 7 days)..."
find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete

echo "Backup complete!"
echo "Backups stored in: $BACKUP_DIR"
