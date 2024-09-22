#!/bin/bash
# Create environment variables file
touch .env

# Delete directories
rm -rf /var/www/volumes/smart-shell/smart-shell-mongo/data

# Create directories
mkdir -p /var/www/volumes/smart-shell/smart-shell-mongo/data