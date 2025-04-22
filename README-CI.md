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
   ```
   docker build -t angular-app .
   ```
   - `docker build`: This builds the Docker image
   - `-t angular-app`: The `-t` flag is used to tag the image. `angular-app` is the name we are giving to the image!
   - `.`: Refers to the current directory as the build context. It will use the current directory to look for the `Dockerfile` and other necessary files for building the               image.
2. Run the Docker Container with the command:
   ```
   sudo docker run -p 4200:4200 <container-name>
   ```
   - `-p 4200:4200`: This maps the port 4200 from your computer to port 4200 of the container.
   - `<container-name>` This is just a placeholder for your container name. For me it would be, `angular-app`
   



## Resources
1. [Testing Docker download](https://hub.docker.com/_/hello-world)
   *Official documentation for testing Docker's Hello World Image*
   -- Referenced in the Docker Setup guide
3. [Docker Documentation: Writing a Dockerfile](https://docs.docker.com/get-started/docker-concepts/building-images/writing-a-dockerfile/)
  *Official guide on how to write a Dockerfile for building images.*
   -- Heavily referenced when creating my Dockerfile
4. [Creating and Running a Docker Container: A Step-by-Step Guide](https://dontpaniclabs.com/blog/post/2024/01/18/creating-and-running-a-docker-container-a-step-by-step-guide/)
  *A Guide on the Manual Setup of Docker Containers*
    -- Used as a template for the Manual creation of the container. I did change the  `-f` flag into the `.` though just because, I put my Dockerfile into the root directory. 
