# Use an existing Maven image as the base
FROM maven:3.6.3-jdk-8

# Copy the CSS file and pom.xml to the container
COPY webapp /home/runner/work/FoiApp/target/FoiApp
# COPY web.xml /home/runner/work/FoiApp/FoiApp/target/FoiApp/webapp/WEB-INF
COPY pom.xml /home/runner/work/FoiApp

# Build the CSS file with Maven
RUN mvn -f /home/runner/work/FoiApp/pom.xml clean package
RUN apt-get update && apt-get install -y python3


# Use official nginx image as the base image
FROM nginx:latest

# Copy the build output to replace the default nginx contents.
COPY webapp /usr/share/nginx/html

# Expose port 80
EXPOSE 8080
CMD [ "index.html" ]
