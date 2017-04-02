FROM codenvy/alpine_jdk8
LABEL maintainer "Levon Karayan (https://github.com/levonk)"

ENV MAVEN_VERSION=3.5.0-beta-1

USER root
RUN cd /tmp && \
	wget -q "http://apache.ip-connect.vn.ua/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
	tar -xzvf "apache-maven-$MAVEN_VERSION-bin.tar.gz" && \
	mv "/tmp/apache-maven-$MAVEN_VERSION" "/usr/lib" && \
	rm "/tmp/"*
USER user

ENV M2_HOME=/usr/lib/apache-maven-$MAVEN_VERSION

ENV PATH=${M2_HOME}/bin:${PATH}

VOLUME /home/user/.m2

VOLUME /workdir
WORKDIR /workdir

ENTRYPOINT ["/usr/lib/apache-maven-3.5.0-beta-1/bin/mvn", "--strict-checksums", "--show-version"]
