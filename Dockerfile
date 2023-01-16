# Use an existing Maven image as the base
FROM nginx:latest

# Copy the CSS file and pom.xml to the container
COPY webapp /usr/share/nginx/html
# COPY web.xml /home/runner/work/FoiApp/FoiApp/target/FoiApp/webapp/WEB-INF
COPY pom.xml /FoiApp/pom.xml

# Build the CSS file with Maven
# RUN mvn -f //FoiApp/pom.xml clean package
RUN apt-get update && apt-get install -y python3

EXPOSE 80

# Serve the CSS file using an HTTP server
CMD ["python3", "-m", "http.server", "80"]

