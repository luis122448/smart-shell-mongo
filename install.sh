#!/bin/bash

# Create environment variables file
touch .env

# Delete directories
sudo rm -rf /var/www/volumes/smart-shell/smart-shell-mongo

# Create directories
mkdir -p /var/www/volumes/smart-shell/smart-shell-mongo/data