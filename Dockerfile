# Use an existing Maven image as the base
FROM maven:3.6.3-jdk-8

# Copy the CSS file and pom.xml to the container
COPY webapp /home/runner/work/FoiApp/webapp
COPY /home/runner/work/FoiApp/webapp/WEB-INF/web.xml /home/runner/work/FoiApp/webapp/WEB-INF
COPY pom.xml /home/runner/work/FoiApp

# Build the CSS file with Maven
RUN mvn -f /home/runner/work/FoiApp/pom.xml clean package

# Serve the CSS file using an HTTP server
CMD ["python", "-m", "http.server", "8080"]
