# Have to use NODE 18 with the from command for the base image
FROM node:18-bullseye

# Copying the application now
COPY ./angular-site /usr/local/app

# Setting the working directory
WORKDIR /usr/local/app

# Install Angular CLI globally
RUN npm install -g @angular/cli

# Install any dependencies (global ones)
RUN npm install -g @angular/cli

# Install any dependencies (Angular app ones)
RUN npm install

# Exposing the Port
EXPOSE 4200

# Running the Angular application
CMD ["npm", "start"]

