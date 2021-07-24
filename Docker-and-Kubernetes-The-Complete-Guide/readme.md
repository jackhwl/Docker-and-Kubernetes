# Dive Into Docker!
# Manipulating Containers with the Docker Client
  * ## overiding default commands
    * docker run busybox echo hi there
    * docker run busybox ls
  * ## Listing Running Containers 
    * docker ps
    * docker ps --all
  * ## 18. Container Lifecycle 
    * docker run = docker create + docker start
    * docker create hello-world
    * docker start containerId
  * ## 19. Restarting Stopped Containers
    * docker ps --all
    * docker start -a containerId
  * ## 20. Removing Stopped Containers
    * docker system prune
  * ## 21. Retrieving Log Outputs
    * docker logs containerId
  * ## 22. Stopping Containers
    * docker stop containerId after 10 seconds will fall back to kill command
    * docker kill containerId
  * ## 23. Multi-Command Containers
  * ## 24. Executing Commands in Running Containers, 
  * ## 25. The Purpose of the IT Flag
    * docker run redis
    * docker exec -it containerId redis-cli
    * -it = -i -t
    * docker exec -it containerId sh
    * docker run -it imageName sh
# Building Custom Images Through Docker Server
  * ## 29. Creating Docker Images
  * ## 31. Building a Dockerfile
    * docker build .
    * docker run containerId
  * ## 32. Dockerfile Teardown
  * ## 33. What's a Base Image?up
  * ## 34. The Build Process in Detail
  * ## 35. A Brief Recap
  * ## 36. Rebuilds with Cache
  * ## 37. Tagging an Image
    * docker build -t jackhwl/redis:latest .
  * ## 39. Manual Image Generation with Docker Commit
    * docker commit -c 'CMD ["redis-serer"]' containerId
    * docker build -t jackhwl/simpleweb .
    * docker run -p 8090:8090 jackhwl/simpleweb
# Docker Compose with Multiple Local Containers
* ## 58. Stopping Docker Compose Containers
  * docker-compose down
  * docker-compose up
  * docker-compose up -d
  * docker-compose up --build
  * docker-compose 
* ## 60. Automatic Container Restarts  
  * Restart Polices: no, always, on-failure, unless-stopped
  * docker-compose ps
# Creating a Production-Grade Workflow
* ## 68. Necessary Commands
  * npm run start
  * npm run test
  * npm run build
  ## 69. Creating the Dev Dockerfile
  * docker build -f Dockerfile.dev .
  ## 72. Starting the Container
  * docker run -p 3000:3000 -v /app/node_modules -v pwd:/app ContainerId
  ## 74. Windows not Detecting Changes - WSL2 Update
    https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide/learn/lecture/11436998#questions/14297316
  * docker build -f Dockerfile.dev -t wenlin:frontend .
  ## 75. Bookmarking Volumes
  * docker run -it -p 3000:3000 -v /home/node/app/node_modules -v ~/frontend:/home/node/app wenlin:frontend
  ## 79. [Windows not Detecting Changes - Docker Compose](https://stackoverflow.com/questions/44643045/running-development-server-with-create-react-app-inside-of-a-docker-container)
  ## 82. Live Updating Tests  
  * docker-compose up
  * docker run -it frontend-web npm run test
  * docker exec -it frontend_web_1 npm run test
  ## 83. Docker Compose for Running Tests
  ## 90. Implementing Multi-Step Builds
  ## 91. Running Nginx
  # Section 7: Continuous Integration and Deployment with AWS
  ## 106. Exposing Ports Through the Dockerfile
  ## 118. Worker Process Setup
  ## 119. Important note about PG module version
  ## 121. Important Update for Table Query
  ## 125. Generating the React App
  ## 126. Fetching Data in the React App
  ## 129. Routing in the React App
  ## 133. Dockerizing a React App - Again!
  ## 135. Dockerizing Generic Node Apps
  ## 138. Postgres Database Required Fixes and Updates
  ## 141. The Worker and Client Services
  ## 148. Opening Websocket Connections
  ## 151. Production Dockerfiles
  ## 154. Altering Nginx's Listen Port
  ## 193. Mapping Existing Knowledge
  * kubectl cluster-info
  ## 195. Adding Configuration Files
  ## 196. Object Types and API Versions
  ## 198. Service Config Files in Depth
  * kubectl apply -f .\client-pod.yaml
  * kubectl apply -f .\client-node-port.yaml
  * kubectl get pods
  * kubectl get services
  ## 199. Connecting to Running Containers
  ## 200. The Entire Deployment Flow
  ## 201. Imperative vs Declarative Deployments
  ## 202. Updating Existing Objects
  ## stoped at 204