# Use an existing Maven image as the base
FROM maven:3.6.3-jdk-8

# Copy the CSS file and pom.xml to the container
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app

# Build the CSS file with Maven
RUN mvn -f /usr/src/app/pom.xml clean package

# Serve the CSS file using an HTTP server
CMD ["python", "-m", "http.server", "8080"]
