#!/usr/bin/env bash

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') | $1" >> logs/disk-check.log
}


threshold="$1"
path="${2:-/}"


if [[ -z "$1" ]]
then
    echo "Usage: ./disk-check.sh <threshold> [path]"
    exit 2
fi
if [[ ! "$1" =~ ^[0-9]+$ ]]
then
    echo "Invalid threshold: please enter a number."
    exit 2
fi


if [[ "$1" -lt 1 || "$1" -gt 100 ]]
then
    echo "Invalid threshold: enter a number from 1 to 100."
    exit 2
fi


if [[ ! -d "$path" ]]
then
    echo "Invalid path: $path"
    exit 2
fi


echo "Path: $path"

usage=$(df -h "$path" | tail -1 | awk '{print $5}')
usage="${usage%\%}"



echo "Usage: $usage%"
echo "Threshold: $threshold%"


if [[ "$usage" -ge "$threshold" ]]
then
    echo "Disk usage has reached the threshold."
    log "Disk check | Path=$path | Usage=$usage% | Threshold=$threshold% | Status=THRESHOLD_REACHED"
    exit 1
else
    echo "Disk usage is below the threshold."
    log "Disk check | Path=$path | Usage=$usage% | Threshold=$threshold% | Status=OK"
    exit 0
fi