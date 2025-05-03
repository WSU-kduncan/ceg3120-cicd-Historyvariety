# Project 5 - Continuous Deployment and Semantic Versioning

The goal of this project was to familiarize us with semantic versioning and continuous deployment for a containerized Angular application using GitHub Actions, DockerHub, and an EC2 instanc


## Part 1: Semantic Versioning

### What is Semantic Versioning?

Semantic versioning follows the format:  
`v<major>.<minor>.<patch>`  
`v3.8.1`

- Major: Breaking changes  
- Minor: New features, no breaking changes  
- Patch: Bug fixes  

### Git Tagging Commands

- View existing tags:
  - `git tag`
- Create new tags:
  - `git tag -a v1.0.0 -m "Initial version"`
- Push tag to GitHub:
  - `git push origin v1.0.0`
 
## GitHub Actions Workflow

- Trigger
  - Only triggers on: tag push
  - No other triggers allowed
    
### Key Actions Used

- `docker/metadata-action`
  - Generates Docker image tags automatically based on Git tags

- `docker/build-push-action` 
  - Builds and pushes Docker images to DockerHub

- `docker/login-action`
  - Logs into DockerHub using credentials stored in GitHub Secrets

### Summary of Workflow

- On push of a new tag:
- Checks out the repository code
- Logs in to DockerHub
- Builds the Docker image
- Tags the image with the Git tag (e.g., `v1.0.0`)
- Pushes the tagged image to DockerHub

### Values to Update for Another Repository

- **DockerHub Repository Name**  
Update in `docker/build-push-action`

- **GitHub Secrets**
  - `DOCKERHUB_USERNAME`
  - `DOCKERHUB_TOKEN`
-  **Workflow File**
  - Adjust tag patterns if not using `v*`
  - Modify image context or build args if Dockerfile differs
  - [My Workflow file!](https://github.com/WSU-kduncan/ceg3120-cicd-Historyvariety/blob/d6cd4254a6b4dbd521f3b1f37b88e0e350b81277/angular-site/wsu-hw-ng-main/Workflow.yml)

## Part 3: Testing & Validation

### Testing the Workflow

- Push a new Git tag:
```
  git tag -a v1.0.1 -m "Test deploy"
  git push origin v1.0.1
```
- Check the **Actions** tab on GitHub:
- Ensure the workflow ran successfully
- Verify Docker build and push steps completed

### Validating the Docker Image

- **Pull the image from DockerHub**: `docker pull your-dockerhub-username/your-image-name:v1.0.1`
- **Run the container**: `docker run --rm your-dockerhub-username/your-image-name:v1.0.1`
- **Check the container behavior**
- Ensure the application runs correctly and responds as expected


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
