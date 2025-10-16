#!/bin/bash
# Automated Server Setup Script
# Author: Your Name

echo "==== Server Setup Started ===="

# Step 1: Update the system
sudo apt update -y && sudo apt upgrade -y

# Step 2: Install Apache web server
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Step 3: Create a new user
read -p "Enter a new username: " username
sudo adduser --gecos "" $username
sudo usermod -aG sudo $username

# Step 4: Configure firewall
sudo ufw allow 'Apache Full'
sudo ufw allow OpenSSH
sudo ufw --force enable

echo "==== Setup Complete! ===="
echo "Apache is running at: http://$(hostname -I | awk '{print $1}')"
echo "New user created: $username"
