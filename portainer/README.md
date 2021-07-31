# Portainer on Ubuntu 20.04 LTS

## Setup

- Install Docker: https://docs.docker.com/engine/install/ubuntu/

- Install Docker Compose

```
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```

- Set permissions

```
sudo chmod +x /usr/local/bin/docker-compose
```

- Create Portainer Volume

```
sudo docker volume create portainer_data
```

- Create the Portainer container

```
sudo docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v /srv/portainer:/data portainer/portainer
```

- Start the Docker container

```
sudo docker start portainer
```

- Portainer should now be running at port `9000`

User: admin
Pass: NO_DEFAULT_PASSWORD

- Choose `local`, then click `connect`
