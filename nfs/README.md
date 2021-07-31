# NFS

## Mount Synology NAS to Ubuntu

- Set NFS Permissions on Synology
- Install NFS on ubuntu client

```
$ sudo apt-get update && sudo apt-get install nfs-common

```

- Create a folder to be shared

```
$ sudo mkdir -p /mnt/DIR_NAME # Create local NFS mount target
```

- Mount to Synology NAS

```
$ sudo mount NAS_IP_ADDRESS_OR_HOSTNAME:/DIR_NAME /mnt/DIR_NAME # Mount NFS share
```

- Mount automatically at boot

```
$ sudo nano /etc/fstab
```

```
# /etc/fstab
...
NAS_IP_ADDRESS_OR_HOSTNAME:/DIR_NAME    /mnt/DIR_NAME   nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0
```

- Reboot to verify
