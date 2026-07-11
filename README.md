# Raspberry Pi Minecraft Server Installer

This repository provides a lightweight installer for Ubuntu Linux and Ubuntu Server on Raspberry Pi that can prepare a Minecraft server for several versions, including:

- 1.20.4
- 1.20.5
- 1.20.6
- 1.21
- 1.21.1
- 1.21.2
- 1.21.3
- 1.21.4
- 1.21.5
- 1.21.6
- 1.21.7
- 1.21.8
- 1.21.9
- 1.21.10
- 1.21.11
- 26.1
- 26.1.1
- 26.1.2
- 26.2

## Usage

Clone this repository, then run:

```bash
git clone https://github.com/ccook0264-arch/pinecraft.git
cd pinecraft
./install
```

If your system prompts for sudo, use:

```bash
sudo ./install
```

The installer now:

- prompts you to accept the Minecraft EULA
- asks which Minecraft version you want
- asks whether to build a vanilla, fabric or paper server
- installs the matching Java runtime for the chosen version family
- downloads the server jar for that server setup
- creates a systemd service so the server starts on boot

## Java selection

- Minecraft 1.20.4 through 1.21.3 use Java 17
- Minecraft 1.21.4 through 1.21.11 use Java 21
- The 26.1 / 26.1.1 / 26.1.2 / 26.2 entries are mapped to the nearest supported 1.21.11-compatible setup for practical deployment

## Notes

- This installer is designed for Ubuntu Linux and Ubuntu Server on Raspberry Pi (and other Debian/Ubuntu-based systems).
- The script will install the server into the local project folder under the server directory and generate a service and startup script for convenience.
