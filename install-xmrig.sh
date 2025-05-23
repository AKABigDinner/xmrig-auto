#!/bin/bash

set -e

echo "Starting system update and upgrade..."
sudo apt update && sudo apt full-upgrade -y

echo "Cleaning up..."
sudo apt-get clean

echo "Checking system architecture..."
arch=$(uname -m)

if [[ "$arch" != "aarch64" && "$arch" != "amd64" ]]; then
    echo "Non-64-bit OS detected: $arch"
    echo "Installing raspbian-nspawn-64 and launching ds64-shell..."
    sudo apt-get install -y raspbian-nspawn-64
    ds64-shell
else
    echo "64-bit OS detected: $arch, skipping raspbian-nspawn-64 installation."
fi

echo "Installing dependencies for xmrig..."
sudo apt-get install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev screen

echo "Cloning xmrig repository..."
if [ ! -d "xmrig" ]; then
    git clone https://github.com/xmrig/xmrig.git
else
    echo "xmrig directory already exists, skipping clone."
fi

cd xmrig || { echo "Failed to change directory to xmrig"; exit 1; }

if [ ! -d "build" ]; then
    mkdir build
fi

cd build || { echo "Failed to change directory to build"; exit 1; }

echo "Running cmake and make to build xmrig..."
cmake ..
make

# Ensure the config.json file exists before copying
if [ -f "../src/config.json" ]; then
    cp ../src/config.json .
else
    echo "config.json not found, skipping copy."
fi

echo "xmrig build completed."
