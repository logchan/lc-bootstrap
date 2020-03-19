#!/bin/bash

RELEASE=$(curl -L https://github.com/docker/compose/releases/latest | grep "<title>" | sed "s/<title>Release \([0-9.]*\).*/\1/" | tr -d '[:space:]')
sudo curl -L "https://github.com/docker/compose/releases/download/$RELEASE/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
