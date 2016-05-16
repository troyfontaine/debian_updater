#!/bin/bash

# Prevent interactive prompts
export DEBIAN_FRONTEND=noninteractive

# Clear out cached kernels to free up space at /boot
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs apt -y purge

# Update cache
apt update -y

# Redundant?
#apt upgrade --allow-remove-essential --allow-change-held-packages  -y

# Full upgrade packages
apt dist-upgrade --allow-remove-essential --allow-change-held-packages  -y

# Clean up
apt autoremove -y
apt autoclean
