#!/bin/bash

# Define the bastion server SSH details
BASTION_IP="192.168.33.10"  # IP of the bastion server
BASTION_KEY="C:/Users/user/Documents/workspace/Linux-admin-projects/Shell-scripting/.vagrant/machines/bastion/virtualbox/private_key"  # Path to bastion's private key

deploy_server() {
    local server_name=$1
    local server_ip=$2

    echo "Accessing $server_name through bastion..."

    # SSH into the bastion and then into the target server
    ssh -i "$BASTION_KEY" -o StrictHostKeyChecking=no -J vagrant@$BASTION_IP <<EOF
    ssh -i /vagrant/.vagrant/machines/$server_name/virtualbox/private_key -o StrictHostKeyChecking=no vagrant@$server_ip <<INNER_EOF
    echo "Updating package list on $server_name..."
    sudo apt update -y || { echo "Error updating package list"; exit 1; }

    echo "Upgrading installed packages on $server_name..."
    sudo apt upgrade -y || { echo "Error upgrading packages"; exit 1; }

    echo "Installing Nginx on $server_name..."
    sudo apt install nginx -y || { echo "Error installing Nginx"; exit 1; }

    echo "Installing Apache2 on $server_name..."
    sudo apt install apache2 -y || { echo "Error installing Apache2"; exit 1; }

    echo "System update and web servers installation completed on $server_name!"
INNER_EOF
EOF
}

# Loop over each server
for i in {1..5}; do
    deploy_server "server$i" "192.168.33.1$i"
done
