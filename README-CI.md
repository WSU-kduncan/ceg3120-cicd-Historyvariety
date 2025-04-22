# Project 4 - CI

## Docker Setup


### Installing on Docker on Windows!
  1. Download Docker Desktop onto your computer: [Docker Download](https://docs.docker.com/desktop/setup/install/windows-install/)
  2. Follow the setup instructions -- the application will walk you through it!
  3. Restart your computer after installation is complete!
  4. Once Docker Desktop is installed and running, navigate to your terminal, Ubuntu, and typing on the command line:
     
     ```
     docker --version
     docker run hello-world
     ```
     (hello-world 1)
  5. Make sure you have WSL2 enabled!

### Additional Independencies
  - Windows: requires WSL2 for the Docker Desktop to work
  - macOS: the Docker desktop should work just with it being downloaded
  - Linux: No additional indepencies required

### Confirmation for Docker installation and Container runnability
  - For installation confirmation run command: `docker --version`
  - For container runnability run command: `docker run hello-world`


## Manually Setting up a Container
1. Before setting up a container we need to build a Docker Image. In the project directory, where the dockerfile is located, run the command:
   `docker build -t angular-app .`
   
2. 



## Resources
1. [Testing Docker download](https://hub.docker.com/_/hello-world)
   *Official documentation for testing Docker's Hello World Image* -- Referenced in the Docker Setup guide
2. [Docker Documentation: Writing a Dockerfile](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/)
  *Official guide on how to write a Dockerfile for building images.* -- Heavily referenced when creating my Dockerfile
