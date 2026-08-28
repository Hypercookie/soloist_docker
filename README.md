# Spotify Soloist Docker

Docker image for running Spotify Soloist with Docker Compose.

## Configuration

Create a `.env` file:

```dotenv
SOLOIST_API_KEY=your_api_key
DEVICE_NAME=Kitchen speaker
```

## Usage

Start Soloist:

```bash
docker compose up -d
```

View logs:

```bash
docker compose logs -f
```

Stop:

```bash
docker compose down
```

## Networking

The container uses host networking because Spotify Soloist requires local network device discovery.

Make sure the Docker host and Spotify device are on the same network and that client isolation, VPNs, or firewalls aren't blocking discovery.

## Supported architectures

* `linux/amd64`
* `linux/arm64`
* `linux/arm/v7`

The image is available at:

```text
ghcr.io/hypercookie/soloist_docker:latest
```
