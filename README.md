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

   