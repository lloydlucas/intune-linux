#!/bin/bash

# Microsoft Edge Repos https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/
echo "Downloading Microsoft Edge and Intune Portal..."
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/ 
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/ubuntu/22.04/prod jammy main" > /etc/apt/sources.list.d/microsoft-ubuntu-jammy-prod.list' 

echo "Installing Microsoft Edge and Intune Portal..."
sudo apt update && sudo apt install -y microsoft-edge-stable intune-portal

echo "Cleaning up..."
sudo rm /tmp/microsoft.gpg
