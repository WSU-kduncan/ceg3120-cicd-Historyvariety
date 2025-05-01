# Use node:18-bullseye as the base image
FROM node:18-bullseye

# Set the working directory inside the container
WORKDIR /app

# Copy only the package.json and package-lock.json first to leverage Docker's cache
COPY package*.json ./

# Install global dependencies (Angular CLI)
RUN npm install -g @angular/cli@15.0.3

# Install local dependencies (Angular app dependencies)
RUN npm install

# Now copy the rest of the application code
COPY . .

# Expose port 4200 for the Angular app
EXPOSE 4200

# Command to start the Angular app
CMD ["npm", "start"]

