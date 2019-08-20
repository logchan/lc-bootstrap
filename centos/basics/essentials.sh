#!/bin/bash

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install -y \
                    make \
                    automake \
                    gcc \
                    gcc-c++ \
                    kernel-devel \
                    cmake \
                    iotop \
                    net-tools \
                    vim \
                    unzip \
                    python36-pip \
                    bash-completion
