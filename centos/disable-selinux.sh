#!/bin/bash

sudo mv /etc/selinux/config /etc/selinux/config.bck
sudo cat /etc/selinux/config.bck | sed 's/SELINUX=enforcing/SELINUX=disabled/' > /etc/selinux/config