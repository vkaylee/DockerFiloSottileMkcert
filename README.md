# DockerFiloSottileMkcert

This repo is used to add a Docker version for Mkcert by github action automatically

The script will automatically run everyday to check the latest release from https://github.com/FiloSottile/mkcert/releases

We don't re-build the binary, just take pre-built binary from github

## Usage
All tags here: https://hub.docker.com/r/vleedev/filosottile_mkcert/tags

Simple run:
```shell
docker run --rm -v $(pwd):/app -e CAROOT=/app vleedev/filosottile_mkcert <input>
```

With specific version:
```shell
docker run --rm -v $(pwd):/app -e CAROOT=/app vleedev/filosottile_mkcert:<tag> <input>
```