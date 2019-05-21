# Ubuntu Bootstrap

## Installation

1. _Updates and other software_ Choose Minimal installation.
2. After reboot: _Help improve Ubuntu_ Choose No, don't send system info

## Configuration

VMware:

```
sudo apt update && apt install open-vm-tools
```

In terminal:

```
sudo apt update && apt install git
git clone https://github.com/logchan/lc-bootstrap
cd lc-bootstrap/ubuntu
./ubuntu.sh
```
