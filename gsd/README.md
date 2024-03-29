# Getting Started with Docker

Official repo for Getting Started with Docker video training course by [@nigelpoulton](https://twitter.com/nigelpoulton)

## first-container

This folder contains the files to build a single-container web app (express, handlebars...)
- Docker hub image: [nigelpoulton/gsd:first-ctr](https://hub.docker.com/repository/docker/nigelpoulton/gsd)

## multi-container

NEEDS UPDATING
This folder contains the files to build a multi-container web app with Compose.
- Pthon flask app with redis cache
- Docker hub image: [nigelpoulton/gsd:compose-app](https://hub.docker.com/repository/docker/nigelpoulton/gsd)

## swarm-stack

This folder contains the files to build a multi-container web app with Swarm Stacks.
- Pthon flask app with redis cache that also returns hostname of container servicing request
- Docker hub image: [nigelpoulton/gsd:swarm-stack](https://hub.docker.com/repository/docker/nigelpoulton/gsd)

## Section 4: Deploying a Containerized App
* Containerizing an App
* * docker image build -t jackhwl/gsd:first-ctr .
* * docker image ls
* Hosting on a Registry
* * docker image push jackhwl/gsd:first-ctr
* * docker image rm jackhwl/gsd:first-ctr
* Running a Containerized App
* * docker container run -d --name web -p 8000:8080 jackhwl/gsd:first-ctr
* Managing a Containerized App
* * docker container ls
* * docker container stop web
* * docker container start web
## Section 5: Microservices and the Real World
* * docker-compose up -d
* * docker-compose down