FROM codenvy/alpine_jdk8
LABEL maintainer "Levon Karayan (https://github.com/levonk)"

ENV MAVEN_VERSION=3.3.9

VOLUME /home/user/.m2

VOLUME /workdir
WORKDIR /workdir

ENTRYPOINT ["/usr/lib/apache-maven-3.3.9/bin/mvn", "--strict-checksums", "--show-version"]
