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

3. Gather additional depencies with these series of commands:
```
npm install
npm start
```
- `npm install` -- installs the addional depencies!
- `npm start` -- starts the angular app!

  Step 4: Verifying the Application is Running!
  - **From inside the container:** just look for some text thats says:
  
  ```
    - Generating browser application bundles (phase: setup)...
  ✔ Browser application bundle generation complete.
  Build at: 2025-05-02T21:45:33.674Z - Hash: c79711fd8a99397d - Time: 24651ms
  ** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **
  ```

  - **From the host browser:** Either click the link provided from your container or go to [link above](http://localhost:4200)
 
## Dockerfile & Building Images
  1. Dockerfile Summary!
  Here is a summary of the commands I used in my dockerfile!
  ```
  FROM node:18-bullseye           # Base image with Node.js
  WORKDIR /app                    # Set the working directory -- where it'll run from
  COPY package*.json ./           # Copy the dependency definitions
  RUN npm install -g @angular/cli@15.0.3  # Making sure to install Angular CLI globally
  RUN npm install                # Making sure to install app dependencies
  COPY . .                       # Copy the rest of the app files
  EXPOSE 4200                    # Expose the Angular's default port
  CMD ["npm", "start"]           # Default command to start the app
  ```

  2.  Build & Run from a Dockerfile!
  - Build the image with the command:
  ```
  docker build -t angular-app .
  ```
  - Run the container with the command:
  ```
  docker run -it -p 4200:4200 angular-app
  ```
  ## Verifying everything again!
  ```
    - Generating browser application bundles (phase: setup)...
  ✔ Browser application bundle generation complete.
  Build at: 2025-05-02T21:45:33.674Z - Hash: c79711fd8a99397d - Time: 24651ms
  ** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **
  ```

  - **From the host browser:** Either click the link provided from your container or go to [link above](http://localhost:4200)

## Creating a DockerHub Repository!
  1. Login to Dockerhub!
  2. Click Repositories -> Create Repository
  3. Then choose a name for it -- ``lastname-course``
  4. Set visbility to public!


## Create a Personal Access Token (PAT)
1. Click your profile -> Account Settings -> Security
2. Under Access Tokens, click `Create`
3. Give it a name! eg: `ci thing `
4. select Read/Write access scope!
5. Save your PAT somewhere secure!

## Logging into Docker
  1. Type in the command: `docker login`
  2. Then enter your docker username and **PAT** when prompted!

## Push Docker Image to DockerHub
  1. Run this series of commands!
     ```
     docker tag angular-app <your-dockerhub-username>/angular-app
     docker push <your-dockerhub-username>/angular-app
     ```

## Link to Repository
[My Repo!](https://hub.docker.com/r/historyvariety/perdue-ceg3120/tags)

### GitHub Actions and DockerHub

## Creating a Personal Access Token (PAT) for DockerHub

  1. Click your profile -> Account Settings -> Security
  2. Under Access Tokens, click `Create`
  3. Give it a name! eg: `ci thing `
  4. select Read/Write access scope!
  5. Save your PAT somewhere secure!

### Setting Secrets in GitHub

1. In your GitHub repository, go to **Settings -> Secrets and variables -> Actions**.
2. Click **New repository secret** twice to add:
   - `DOCKER_USERNAME` — Your DockerHub username
   - `DOCKER_TOKEN` — The token from DockerHub

### Secrets I used!
- `DOCKER_USERNAME`	-- DockerHub account username
- `DOCKER_TOKEN` -- DockerHub access token (PAT)

### Summary of Git WorkFlow
My Github workflow automatically:
- Runs whenever code (*a commit*) is pushed to the `main` branch!
- Builds a Docker image from the project's `Dockerfile`!
- Authenticates with DockerHub using repository secrets!
- Pushes the Docker image to DockerHub!


### Adapting My Workflow file for Other/Future Projects!
- **Change the image name/tag** in:
  ```yaml
  tags: ${{ secrets.DOCKER_USERNAME }}/<new-app-name>:<tag>
why do this? To reflect the new repository or image name! 

- Secrets
    - Add `DOCKER_USERNAME` and `DOCKER_TOKEN` into my new repository’s secrets!
- [My Workflow file!](https://github.com/WSU-kduncan/ceg3120-cicd-Historyvariety/blob/d6cd4254a6b4dbd521f3b1f37b88e0e350b81277/angular-site/wsu-hw-ng-main/Workflow.yml)

## Testing & Validation

### How to Test Your Workflow

1. Push a new commit to the `main` branch of your repository!
2. Go to your GitHub repository on the web!
3. Click the `Actions` tab to view your recent workflow runs!
4. Confirm that the lastest run did everything you said in your Workflow file:
   - Triggered successfully after your commit.
   - Completed all the steps without any errors.
   - Displays the logs showing the image was built and pushed.

### How to Validate the Docker Image

After the workflow completes:

1. Visit [DockerHub](https://hub.docker.com/) and log in to your account!
2. Navigate to your **Repositories** and locate that the image was pushed (e.g., `your-username/angular-app`).
3. Pull and run the image locally using Docker (in your terminal!):

```
   docker pull your-username/angular-app:latest
   docker run -p 4200:4200 your-username/angular-app:latest
```
4. Open your browser and go to [link above](http://localhost:4200)
5. Check the output to make sure your containier is running!

### Documentation


## Project Description


  The goal of this project is to automatically build a Docker image and upload it to DockerHub whenever we update the main branch on GitHub.
  This all saves a lot time and keeps everything up to date without needing to do it manually!
  This project helped familairize me with Git actions and Workflow files too!

  
## What is not working!


 - The webpage for some reason is not loading on my end. I think it maybe a security group issue? It keeps saying err_connection whenever I click the link provided after building the image.


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
   
5. [GitHub Actions: Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)  
   *Documentation on writing a `.yml` file for workflows*  
   -- Used when I wanted to make sure my trigger and steps were working right

6. [GitHub Marketplace - docker/login-action](https://github.com/docker/login-action)  
   *An official action used to log into DockerHub from GitHub Actions*  
   -- Used in my workflow file so I didn’t have to write a manual login step
   
7. [Docker Docs: Tagging Images](https://docs.docker.com/engine/reference/commandline/tag/)  
   *Simple explanation on how to tag images for Docker*  
   -- Helpful when making sure my image had the right name before pushing 
