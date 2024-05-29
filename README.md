# Docker Documentation

## Table of Contents
1. [Introduction to Docker](#introduction-to-docker)
2. [Docker Installation](#docker-installation)
3. [Basic Docker Commands](#basic-docker-commands)
4. [Docker Compose](#docker-compose)
   - [Introduction to Docker Compose](#introduction-to-docker-compose)
   - [Setting Up Docker Compose](#setting-up-docker-compose)
   - [Running Multiple Containers](#running-multiple-containers)
5. [Docker Networks](#docker-networks)
   - [Creating and Using Networks](#creating-and-using-networks)
6. [Docker Volumes](#docker-volumes)
   - [Creating and Using Volumes](#creating-and-using-volumes)

## Introduction to Docker
Docker is a platform designed to make it easier to create, deploy, and run applications by using containers.

### What is a Container?
A container is a lightweight, standalone, executable package that includes everything needed to run a piece of software, including the code, runtime, system tools, libraries, and settings. A Docker container is a running instance of a Docker image. It encapsulates the application or service and its dependencies, running in an isolated environment.

### Docker Engine
The core part of Docker, which is a client-server application that comprises:
- A Server with a long-running daemon process (dockerd)
- APIs that specify interfaces that programs can use to talk to and instruct the Docker daemon
- A command-line interface (CLI) client (`docker`).

### Containerization
Containerization is a technology that allows you to package and distribute software applications in a consistent and isolated manner, making it easier to deploy and run them across different environments.

### Why Containers and Their Benefits?
- **Different Operating Systems**: Developers and users often have different operating systems (Windows, macOS, Linux), which can lead to compatibility issues when running applications.
- **Varying Project Setup Steps**: The steps required to set up and run a project can vary based on the operating system, making it challenging to maintain consistent environments.
- **Dependency Management**: As projects grow in complexity, keeping track of dependencies and ensuring they are installed correctly across different environments becomes increasingly difficult.

### Benefits
- **Single Configuration File**: Containers allow you to describe your application's configuration, dependencies, and runtime environment in a single file (e.g., Dockerfile), making it easier to manage and reproduce environments.
- **Isolated Environments**: Containers run in isolated environments, ensuring that applications and their dependencies do not conflict with other applications or the host system.
- **Local Setup Simplification**: Containers make it easy to set up and run projects locally, regardless of the operating system or environment, ensuring a consistent development experience.
- **Auxiliary Services and Databases**: Containers simplify the installation and management of auxiliary services and databases required for your projects, such as MongoDB, PostgreSQL, or Redis.

### Advantages of Docker
- Consistency
- Isolation
- Efficiency
- Portability
- Scalability
- Simplified Deployment (CI/CD)

### Used Terminologies
1. **Dockerfile**: A text document that contains all the commands a user could call on the command line to assemble an image. It is used to automate the creation of Docker images.
2. **Image**: A lightweight, standalone, and executable software package that includes everything needed to run a piece of software, including the code, runtime, libraries, and settings.
3. **Docker Registry**: A service that stores and distributes Docker images. It acts as a central repository where you can push and pull Docker images.
4. **DockerHub**: The main public Docker registry maintained by Docker, Inc. It hosts a vast collection of Docker images contributed by the community and various organizations.
5. **Port Mapping**: A feature that allows you to map a port on your host system to a port inside a Docker container.

   ```sh
   docker run -p <host_port>:<container_port> <image_name>
   ```

## Docker Installation
To install Docker, follow the official Docker installation guide for your operating system: Docker Installation

### Installation Steps for Ubuntu on WSL2
If you have Ubuntu installed on WSL2 already, follow these steps:

``` sh
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo service docker start
```

### Verify Docker installation:

``` sh
sudo service docker status
docker run hello-world
```

## Basic Docker Commands
Here are some essential Docker commands that will help you get started:

- Run a container: `docker run -p 8080:80 nginx`
- List all running containers: `docker ps`
- List all containers: `docker ps -a`
- List all images: `docker images`
- Build an image: `docker build -t my-image .` 
- Pull an image from Docker Hub: `docker pull ubuntu`
- Push an image to Docker Hub: `docker push my-image`
- Stop a container: `docker stop my-container`
- Start a container: `docker start my-container`
- Remove a container: `docker rm my-container`
- Remove an image: `docker rmi my-image`
- Execute a command in a running container: `docker exec -it my-container bash`
- View container logs: `docker logs my-container`
- Manage Docker networks: `docker network`
- Manage Docker volumes: `docker volume`

## Docker Compose 
### Introduction to Docker Compose
Docker Compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

### Setting Up Docker Compose
To install Docker Compose, follow the official installation guide: Docker Compose Installation

### Running Multiple Containers
Here is an example of a docker-compose.yaml file that sets up a multi-container application:

``` yaml
version: '3.8'

services:
  mongodb:
    image: mongo
    container_name: mongodb
    ports:
      - "27017:27017"
    volumes:
      - mongodb_data:/data/db

  backend:
    image: backend
    container_name: backend_app
    depends_on:
      - mongodb
    ports:
      - "3000:3000"
    environment:
      MONGO_URL: "mongodb://mongodb:27017"

volumes:
  mongodb_data:
```

To start the application stack, run:
``` sh
docker-compose up
```

To stop the application stack and remove containers, networks, and volumes, run:
``` sh
docker-compose down --volumes
```

## Docker Networks
### Creating and Using Networks
Docker networks allow you to isolate and secure containers. To create and use a network, follow these steps:

### 1. Create a network:
``` sh 
docker network create my_custom_network
```

### 2. Run a container and connect it to the network:
``` sh
docker run -d --name my_container --network my_custom_network nginx
```

## Docker Volumes
### Creating and Using Volumes
Volumes are used to persist data generated and used by Docker containers. To create and use volumes, follow these steps:

### 1. Create a volume:
``` sh
docker volume create my_volume
```

### 2. Run a container with a volume: 
``` sh
docker run -d -v my_volume:/data --name my_container nginx
```

### Remove a volume:
``` sh
docker volume rm my_volume
```
## Bind Mounts
Bind mounts allow you to share files between the host machine and the container. They are useful for development environments where you want real-time synchronization of files.

### 1. Run a container with a bind mount:
``` sh 
docker run -d -v /path/on/host:/path/in/container --name my_container nginx
```

This setup is particularly useful for development scenarios where hot reloading is required. Any changes made to the files on the host machine will be reflected in the container, allowing for immediate feedback and faster development cycles.



