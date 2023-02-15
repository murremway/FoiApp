# Use an official maven runtime as a parent image
FROM maven:3.8.3-jdk-11 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml .
COPY webapp/ ./src/

# Build the application
RUN mvn clean package

# Use an official Nginx image as a parent image for the final stage
FROM nginx:1.21.3-alpine

# Copy the built WAR file from the previous stage to the Tomcat webapps directory
COPY webapp /usr/share/nginx/html

# Expose port 8080 for Tomcat
EXPOSE 80

# Start the Nginx web server
CMD ["nginx", "-g", "daemon off;"]
