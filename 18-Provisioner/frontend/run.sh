#!/bin/bash

apt-get update
apt-get install -y apache2 

systemctl restart apache2.service

echo "Welcome to the world of Terraform" >> /var/www/html/info.html
