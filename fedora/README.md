# Fedora bootstrap

## Installation

1. Choose Custom for disk partitioning.

## Configuration

Run:

```
sudo dnf install git
git clone https://github.com/logchan/lc-bootstrap.git
cd lc-bootstrap
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
