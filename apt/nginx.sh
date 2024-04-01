#!/bin/bash

sudo apt update
sudo apt install nginx
sudo sytsemctl enable nginx
sudo systemctl start nginx
sudo sytsemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
