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
FROM openjdk:11-jre-slim

# Set the working directory to /app
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/myapp.jar .

# Start the application
CMD ["java", "-jar", "myapp.jar"]
