# Use an existing Maven image as the base
FROM maven:3.6.3-jdk-8

# Copy the CSS file and pom.xml to the container
COPY webapp /home/runner/work/FoiApp/FoiApp/target/FoiApp
# COPY web.xml /home/runner/work/FoiApp/FoiApp/target/FoiApp/webapp/WEB-INF
COPY pom.xml /home/runner/work/FoiApp

# Build the CSS file with Maven
RUN mvn -f /home/runner/work/FoiApp/pom.xml clean package
RUN apt-get update && apt-get install -y python3

# Serve the CSS file using an HTTP server
CMD ["python3", "-m", "http.server", "8080"]

