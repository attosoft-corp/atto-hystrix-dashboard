# Docker file for the Read Service
#
# Version 0.0.1

#jdk image
FROM frolvlad/alpine-oraclejdk8:slim

# install

# label for the image
LABEL Description="Hystrix Dashboard" Version="0.0.1"

# the version of the archive
ARG VERSION=0.0.1

# mount the temp volume
VOLUME /tmp

# Add the service as app.jar
ADD target/hystrix-dashboard-${VERSION}-SNAPSHOT.war app.war

# touch the archive for timestamp
RUN sh -c 'touch /app.war'

# entrypoint to the image on run
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.war"]
