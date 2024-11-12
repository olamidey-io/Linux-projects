#!/bin/bash

# Define the server's details
SERVER_NAME="single-server"
SERVER_PORT=2230
PRIVATE_KEY_PATH="./.vagrant/machines/single-server/virtualbox/private_key"

echo "Accessing server: $SERVER_NAME"

# SSH into the server and run commands
ssh -i "$PRIVATE_KEY_PATH" -p "$SERVER_PORT" -o IdentitiesOnly=yes -o StrictHostKeyChecking=no vagrant@127.0.0.1 <<EOF
    echo "Updating package list on $SERVER_NAME..."
    sudo apt update -y || { echo "Error updating package list"; exit 1; }

    echo "Upgrading installed packages on $SERVER_NAME..."
    sudo apt upgrade -y || { echo "Error upgrading packages"; exit 1; }

    echo "Installing Nginx on $SERVER_NAME..."
    sudo apt install nginx -y || { echo "Error installing Nginx"; exit 1; }

    echo "Installing Apache2 on $SERVER_NAME..."
    sudo apt install apache2 -y || { echo "Error installing Apache2"; exit 1; }

    echo "System update and web servers installation completed on $SERVER_NAME!"
EOF
