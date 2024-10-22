#!/bin/bash

deploy_server() {
    local server=$1
    echo "Accessing server: $server"
    
    # Ping to check if the server is reachable
    if ! ping -c 1 -W 1 "$server" > /dev/null 2>&1; then
        echo "Error: Server $server is unreachable."
        return 1
    fi
    
    # SSH into the server and run commands
    ssh vagrant@$server << EOF
    echo "Updating package list on $server..."
    sudo apt update -y || { echo "Error updating package list"; exit 1; }

    echo "Upgrading installed packages on $server..."
    sudo apt upgrade -y || { echo "Error upgrading packages"; exit 1; }

    echo "Installing Nginx on $server..."
    sudo apt install nginx -y || { echo "Error installing Nginx"; exit 1; }

    echo "Installing Apache2 on $server..."
    sudo apt install apache2 -y || { echo "Error installing Apache2"; exit 1; }

    echo "System update and web servers installation completed on $server!"
    EOF
}

# Ensure server addresses are provided
if [ "$#" -eq 0 ]; then
    echo "Error: No server addresses provided."
    echo "Usage: $0 server1 server2 ..."
    exit 1
fi

# Loop over each server provided
for server in "$@"; do
    deploy_server "$server"
done
