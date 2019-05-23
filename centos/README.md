# CentOS bootstrap

## Installation

1. Choose Custom for disk partitioning.

## Configuration

For minimal installation (no network), run:

```
sudo -s
nmcli d

# dhcp
nmcli con add type ethernet con-name NAME ifname DEVICENAME
# static
nmcli con add type ethernet con-name NAME ifname DEVICENAME ip4 IP/MASK gw4 GATEWAY
nmcli con mod NAME ipv4.dns "DNS1 DNS2"

exit
```

Run:

```
sudo yum -y install git
git clone https://github.com/logchan/lc-bootstrap.git
cd lc-bootstrap/centos
```

Then,
```
./disable-selinux.sh
```
And reboot. This step is explicit (not in `basics`) to inform the security risk.

Now,
```
./basics.sh
```
