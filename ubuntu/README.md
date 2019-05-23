# Ubuntu Bootstrap

## Installation

1. _Updates and other software_ Choose Minimal installation.
2. After reboot: _Help improve Ubuntu_ Choose No, don't send system info

## Configuration

VMware: execute following, then reboot

```
sudo apt update
sudo apt install open-vm-tools open-vm-tools-desktop
```

Copy and paste:

```
sudo apt update 
sudo apt install git
git clone https://github.com/logchan/lc-bootstrap.git
cd lc-bootstrap/ubuntu
./basics.sh
```

If in GUI, one more line:

```
./gui.sh
```
