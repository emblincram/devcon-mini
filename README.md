# DevCon Minimal (Docker/DevContainer)

Kurze Notizen zum Bauen und Nutzen des minimalen Docker-Images.

## Docker Installation

```bash
sudo apt update
sudo apt install docker.io -y
sudo apt install docker-compose -y
sudo systemctl enable --now docker
```

## Access Rights

Aktuellen User zur Docker-Gruppe hinzufügen, damit `docker` ohne `sudo` funktioniert:

```bash
sudo usermod -aG docker $USER
```

## Build

Lokales Image (mit lokalem `Dockerfile`):

```bash
docker build --no-cache -t devcon-pq-min .
```

Alternativ: anderes Dockerfile (z. B. DevContainer):

```bash
docker build -t devcon-pq-min -f .devcontainer/Dockerfile .
```

## Run

### Einfach starten

```bash
docker run -it --rm devcon-pq-min /bin/bash
```

### Mit Persistent Volumes (Beispiel)

```bash
docker run -it --rm \
  -v $(pwd)/poky:/home/yocto/poky \
  -v $(pwd)/sstate-cache:/home/yocto/sstate-cache \
  -v $(pwd)/downloads:/home/yocto/downloads \
  devcon-pq-min
```

## GHCR (GitHub Container Registry)

Beispiel A:

- Organization/User Name: `a-eberle`
- Image Name: `devcon-pq-min`
- `CR_PAT` enthält ein Personal Access Token.

```bash
echo "${CR_PAT}" | docker login ghcr.io -u a-eberle --password-stdin
docker build -t ghcr.io/a-eberle/devcon-pq-min:latest .
docker push ghcr.io/a-eberle/devcon-pq-min:latest
```

Pull & Run:

```bash
docker pull ghcr.io/a-eberle/devcon-pq-min:latest
docker run -it --rm ghcr.io/a-eberle/devcon-pq-min:latest /bin/bash
```

Beispiel B (alternative Namensgebung):

- Organization/User Name: `emblincram`
- Image Name: `devcon`

```bash
echo "${CR_PAT}" | docker login ghcr.io -u emblincram --password-stdin
docker build -t ghcr.io/emblincram/devcon:latest .
docker push ghcr.io/emblincram/devcon:latest
```

Pull & Run:

```bash
docker pull ghcr.io/emblincram/devcon:latest
docker run -it --rm ghcr.io/emblincram/devcon:latest /bin/bash
```

## Cleanup

Ein bestimmtes Image entfernen:

```bash
docker rmi <IDENTIFIER>
```

Dangling Images entfernen:

```bash
docker image prune -f
```

Alle ungenutzten Images entfernen:

```bash
docker image prune -a
```

Alle Container stoppen/entfernen (auskommentiert, mit Vorsicht verwenden):

```bash
#docker stop $(docker ps -aq)
#docker rm $(docker ps -aq)
```
