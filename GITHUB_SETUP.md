# How to Set Up on GitHub

## Option 1: Using GitHub Web Interface (Easiest)

1. **Create a new repository on GitHub**:
   - Go to https://github.com/new
   - Repository name: `minecraft-fabric-server`
   - Description: "Minecraft Fabric Server installer for Raspberry Pi 5"
   - Make it **Public** (so others can use it)
   - Click "Create repository"

2. **Upload files**:
   - Go to your new repository
   - Click "Add file" → "Upload files"
   - Drag and drop all files from this folder into the browser
   - Commit the changes

## Option 2: Using Git Command Line

1. **Initialize git locally** (on your PC):
```bash
cd minecraft-fabric-server
git init
git add .
git commit -m "Initial commit: Minecraft Fabric server installer"
```

2. **Connect to GitHub**:
```bash
git remote add origin https://github.com/YOUR_USERNAME/minecraft-fabric-server.git
git branch -M main
git push -u origin main
```

3. **On your Raspberry Pi**, clone it:
```bash
git clone https://github.com/YOUR_USERNAME/minecraft-fabric-server.git
cd minecraft-fabric-server
sudo ./install
```

## What Gets Shared

✅ `install` - Main installer script  
✅ `README.md` - Full documentation  
✅ `QUICK_START.md` - Quick reference  
✅ `LICENSE` - MIT License  
✅ `minecraft-server.service` - Optional systemd service  
✅ `scripts/backup.sh` - Backup utility  
✅ `.gitignore` - Keeps repo clean  

## File Structure

```
minecraft-fabric-server/
├── install                    # Main script (chmod +x before pushing)
├── README.md                  # Full documentation
├── QUICK_START.md            # Quick reference
├── LICENSE                   # MIT License
├── minecraft-server.service  # Systemd service (optional)
├── .gitignore               # Ignore downloaded files
└── scripts/
    └── backup.sh            # World backup utility
```

## Making Install Script Executable

After cloning on GitHub, users might need to make it executable:

```bash
chmod +x install
sudo ./install
```

Or, you can add this note to QUICK_START.md.

## Next Steps

1. Push this repo to GitHub
2. Share the link with friends
3. They can clone and run: `sudo ./install`
4. They'll get an interactive setup wizard

## Example Share Instructions

When sharing, tell them:
```
git clone https://github.com/YOUR_USERNAME/minecraft-fabric-server.git
cd minecraft-fabric-server
sudo ./install
```

That's all they need!
