FROM codenvy/alpine_jdk8
LABEL maintainer "Levon Karayan (https://github.com/levonk)"


ADD *.sh /usr/local/bin/
COPY settings.template.xml /usr/share/maven/ref/settings.template.xml

VOLUME /home/user/proj
WORKDIR /home/user/proj
#ENTRYPOINT ["find / -print"]
ENTRYPOINT ["/usr/lib/apache-maven-3.3.9/bin/mvn", "--strict-checksums", "--show-version"]
