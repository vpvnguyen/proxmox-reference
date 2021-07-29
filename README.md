# proxmox-reference

Experimental sandbox and documents for creating VMs on Intel NUC

## Default Settings

UI: https://xxx.xxx.x.x:8006/
User: root
Pass: GLOBAL_PASS

## Users

### Linux PAM standard authentication

In this case a system user has to exist (e.g. created via the adduser command) on all nodes the user is allowed to login, and the user authenticates with their usual system password.

```
useradd USERNAME
passwd PASSWORD
groupadd GROUP_NAME
usermod -a -G GROUP_NAME USERNAME
```
