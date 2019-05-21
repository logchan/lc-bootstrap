#!/bin/bash

sudo apt update && \
     apt install -y build-essential \
                    ca-certificates \
                    cmake \
                    curl \
                    iotop \
                    net-tools \
                    ssh \
                    vim

wget -O /tmp/vscode.deb https://go.microsoft.com/fwlink/?LinkID=760868
dpkg -i /tmp/vscode.deb
rm /tmp/vscode.deb
