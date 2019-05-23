#!/bin/bash

sudo setenforce 0
sudo mv /etc/selinux/config /etc/selinux/config.bck
sudo sh -c 'cat /etc/selinux/config.bck | sed s/SELINUX=enforcing/SELINUX=disabled/ > /etc/selinux/config'
