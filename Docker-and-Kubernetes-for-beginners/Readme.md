## Introduction
  - Course overview
  - Download slides, notes and diagrams
## Container Introduction
  - Foundation of containers
  - Containers Vs Virtual Machine
  - Why developers should use containers
  - Install docker on Linux
  - Install docker on Mac
  - Run your first container
  - Docker cli commands
    - docker pull
    - docker run
    - docker ps
    - docker ps -a
    - docker stop <id>
    - docker run <id>
    - docker images
    - docker rmi <id>
    - docker run -d <image_name>
    - docker exec -it <container_id> /bin/bash
## Docker essentials for beginners
  - Key Docker Concepts: Images, Containers, Dockerfiles
  - Writing a Dockerfile and building a container image
    - docker build -t vite-test .
    - docker run -p 5173:5173 vite-test
    