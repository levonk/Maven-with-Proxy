FROM codenvy/alpine_jdk8
MAINTAINER Levon Karayan (https://github.com/levonk)

ADD *.sh /usr/local/bin/
COPY settings.template.xml /usr/share/maven/ref/settings.template.xml
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
