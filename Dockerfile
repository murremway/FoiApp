# Use an official maven runtime as a parent image
FROM maven:3.8.3-jdk-11 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml and source code to the container
COPY pom.xml .
COPY webapp/ ./src/

# Build the application
RUN mvn clean package

# Create a new stage for the runtime image
FROM tomcat:9-jdk11

# Copy the built WAR file from the previous stage to the Tomcat webapps directory
COPY --from=build /app/target/FoiApp.war /usr/local/tomcat/webapps/

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat and tail the logs
CMD ["catalina.sh", "run"]
