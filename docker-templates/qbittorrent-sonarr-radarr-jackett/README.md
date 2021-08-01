# qbittorrent-sonarr-radarr-jackett

## Setup

- Get `PUID` and `PGID`

```
id $USERNAME
```

- Create config files

```
sudo mkdir /etc/radarr/ /etc/sonarr/ /etc/jackett/ /etc/qbittorrent
```

- Take ownership of directories

```
sudo chown -R $USERNAME:$GROUP /etc/radarr/ /etc/deluge/ /etc/sonarr/ /etc/jackett
```

## Web UI

Visit IP_ADDRESS:PORT for UI

- 8080
- 9117
- 8989
- 7878

## Configure qBittorrent

- User: admin
- Password: adminadmin
- Change account credentials

## Configure Jackett

- Add indexers

## Configure Sonarr

- Add download client
- Change host from localhost to IP_ADDRESS
- Add username and password to torrent client

### Settings > Media Management

- Hardlinks

### Settings > Profiles

- Set and remove profiles

### Settings > Indexers

- Add indexers from Jackett

### Settings > Download Clients

- Set download client
- Change host from `localhost` to $IP_ADDRESS
- Set remote path mappings:
- Host: $IP_ADDRESS
- Remote Path: $DIR_PATH_ON_NAS
- Local Path: $TORRENT_CONTAINER_PATH

## Configure Radarr

- See Sonarr config
