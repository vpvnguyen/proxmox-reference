# OpenVPN Gateway w/ Kill Switch

## Specs

Image: Ubuntu Server 20.04 LTS
vCPU: 4
RAM: 2-8GB
HDD: 12GB

## Setup

- Update and upgrade packages

```
sudo apt update && sudo apt upgrade
```

- Configure Static IP

```
sudo nano /etc/netplan/01-netcfg.yaml
```

```yaml
network:
  ethernets:
    ens18:
      addresses: [192.168.x.xx/24]
      gateway4: 192.168.x.x
      nameservers:
        addresses: [1.1.1.1, 1.0.0.1]
      dhcp4: false
      optional: true
  version: 2
```

```
sudo netplan apply
```

- Verify connection

```
ping -c 3 google.com
```

- Download OVPN Config files (NordVPN)

```
cd /etc/openvpn
sudo wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
sudo unzip ovpn.zip
```

- Choose NordVPN server and configure OpenVPN. Replace CC#### with country code and server number

```
sudo nano /etc/openvpn/connect.sh
sudo openvpn --config "/etc/openvpn/ovpn_udp/us8507nordvpn.com.udp.ovpn" --auth-user-pass /etc/openvpn/auth.txt
```

- Create credentials file

```
sudo nano /etc/openvpn/auth.txt
Username@email.com
Password
```

- Configure iptables

```
sudo nano /etc/openvpn/iptables.sh
```

- Copy info from `iptables.sh

- Enable ipv4 traffic forwarding

```
sudo sh -c "echo 1 > /proc/sys/net/ipv4/ip_forward"
```

- Create rc.local service

```
sudo nano /etc/systemd/system/rc-local.service
```

- Create rc.local script

```
sudo nano /etc/rc.local
sudo chmod +x /etc/rc.local
```

- Test connection

```
sudo bash /etc/openvpn/iptables.sh
sudo bash /etc/openvpn/connect.sh
```

Point another device’s default gateway at your VPN server. Ping google.com

```
ping -c 3 google.com
```

`CTRL-C` to kill OpenVPN

- Ping should stop on remote box.

- If all is working, enable the service and reboot. IPTables are assigned each boot, and then the VPN connects. This allows troubleshooting or maintenance by commenting out `rc.local` calls and boot the server without IPTables restrictions.

- Configure the IP address, gateway, network interfaces, DNS nameservers, etc.

```
sudo nano /etc/netplan/01-network-manager-all.yaml
```

- Example yaml file:

```yaml
network:
  version: 2
  renderer: NetworkManager
  ethernets:
    enp0s3:
      dhcp4: false
      addresses: [192.168.1.x/24] # Set to this machine's static ip
      gateway4: 192.168.1.x # Set to IP of VPN router
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
```

- Apply settings

```
sudo netplan apply
```

- If issues connecting to VPN router, check default gateway:

```
ip route
# or
route -n
```

- Set default gateway:

```
sudo ip route add default via 192.168.x.x
```

- To enable and start rc.local service

```
sudo systemctl enable rc-local
sudo systemctl start rc-local.service
```
