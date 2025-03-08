#!/bin/bash

# Update package lists and install required packages
sudo apt-get update -y
sudo apt-get install -y nginx  jq

# Configure Nginx to act as a proxy
echo "server {
    listen 80;
    location / {
        proxy_pass http://www.google.com;
    }
}" | sudo tee /etc/nginx/sites-available/default > /dev/null

# Restart Nginx to apply the changes
sudo systemctl restart nginx

