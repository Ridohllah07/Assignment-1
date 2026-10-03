# Assignment 1 - Linux Diagnostic Toolkit

## Description
Toolkit to collect system info, check disk usage, and network connectivity.

## Scripts
- system-info.sh: Displays hostname, user, date/time, OS, kernel, uptime, CPU, memory, pwd
- disk-check.sh <threshold> [path]: Checks disk usage vs threshold (1-100), default path /
- network-check.sh <hostname-or-ip> [port]: Resolves host, pings, shows interfaces, optional TCP port check

## Usage
```bash
chmod +x *.sh
./system-info.sh
./disk-check.sh 80 /
./network-check.sh google.com 443

AUTHOR
ABULLATEEF RIDWANULLAH

##files Project Structure
- system-info.sh - Displays system information
- disk-check.sh - Checks disk usage
- network-check.sh - Checks network connectivity
- grade.sh - Runs assignment tests
- logs/ - Stores log