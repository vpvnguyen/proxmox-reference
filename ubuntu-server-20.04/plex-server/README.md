# Plex Server for Ubuntu Server 20.04

## Setup

- Enable the Plex Media Server repository

```
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
sudo apt update
```

- Install repository

```
sudo apt install plexmediaserver
```

- Setup Plex on the Web GUI at `IP_ADDRESS:32400/web`
