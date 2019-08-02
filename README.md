# docker-compose-graphviz

Turn a `docker-compose.yml` into a Graphviz `.dot` file. Currently in prototype state. For an example of the output,
check out https://github.com/abesto/abesto-net-docker.

## Using as a docker container
build image via docker-compose file
```sh
docker-compose build 
```
change volume in docker-compose file (data) to where the corresponding docker-compose file you would like to draw is
```sh
docker-compose run --rm dcviz
```
container will generate out.png in the data folder

## Installation

```sh
go install github.com/abesto/docker-compose-graphviz
```

## Usage

`cd` into a directory that has a `docker-compose.yml` file.

```sh
docker-compose-graphviz | dot -odocker-compose.jpg -Tjpg && open docker-compose.jpg
```
