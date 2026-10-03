#!/usr/bin/env bash

echo    "  -----------------------------------
                SYSTEM INFORMATION
           -----------------------------------"
user=$(whoami)
hostname=$(hostname)
kernel=$(uname -r)
directory=$(pwd)
datetime=$(date)
OS=$(lsb_release -d | cut -f2)
uptime=$(uptime -p)
CPU=$(lscpu | grep "Model name" | cut -d ':' -f2 | xargs)
memory=$(free -h | grep "Mem")


echo "User: $user"
echo "Hostname: $hostname"
echo "Kernel: $kernel"
echo "Directory: $directory"
echo "Date/Time: $datetime"
echo "Operating System: $OS"
echo "Uptime: $uptime"
echo "CPU: $CPU"
echo "Memory: $memory"
